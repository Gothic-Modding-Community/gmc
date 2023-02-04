"use strict";

class MarkCodeLineManager {
    constructor() {
        this.lineElement = null;
        this.lineCodeBlock = null;
        this.className = "hll";
    }
    setElement() {
        if (this.lineElement) {
            this.unsetElement();
        }

        let hash = window.location.hash;

        if (hash === "" || !hash.includes("example")) {
            // gmcDebug(`⏩ hash is empty`);
            return;
        }

        this.lineElement = document.querySelector(hash);

        if (!this.lineElement) {
            return;
        }

        this.lineCodeBlock = this.lineElement.closest("code");

        gmcAddClassToElement(this.className, this.lineElement, hash);
        this.showHiddenMarkedLine();
        this.setSpanWidth();
    }
    unsetElement() {
        if (!this.lineElement) {
            return;
        }
        this.lineElement.classList.remove(this.className);
        this.unsetSpanWidth();
        this.lineElement = null;
        this.lineCodeBlock = null;
    }
    showHiddenMarkedLine() {
        let tabbedBlock = this.lineElement.closest(".tabbed-block");

        if (!tabbedBlock || window.getComputedStyle(tabbedBlock).display !== "none") {
            return;
        }

        let tabbedContent = tabbedBlock.parentElement;
        let childBlocks = tabbedContent.children;
        let blockIndex;

        for (blockIndex = 0; blockIndex < childBlocks.length; blockIndex++) {
            if (childBlocks[blockIndex] === tabbedBlock) {
                break;
            }
        }

        let blockInputElement = tabbedContent.parentElement.children[blockIndex];
        blockInputElement.click();
    }
    setSpanWidth() {
        if (!this.lineCodeBlock) {
            return;
        }
        let children = this.lineCodeBlock.childNodes;
        let max = 0;
        for (let child of children) {
            let current = child.innerText.length;
            if (current > max) {
                max = current;
            }
        }
        for (let child of children) {
            // child.setAttribute("style", `min-width: ${max * 8.5}px;`)
            child.setAttribute("style", `min-width: ${max * 0.65}em;`)
        }
    }
    unsetSpanWidth() {
        if (!this.lineCodeBlock) {
            return;
        }
        let children = this.lineCodeBlock.childNodes;
        for (let child of children) {
            child.removeAttribute("style");
        }
    }
}

const gGMC_LOCAL = window.location.hostname === "127.0.0.1";
const gGMC_DEV = window.location.hostname.toLowerCase() !== "gothic-modding-community.github.io" && !gGMC_LOCAL;
const gMarkCodeLineManager = new MarkCodeLineManager();
const MutationObserver = window.MutationObserver || window.WebKitMutationObserver;

const gDevHrefOffset = gGMC_DEV ? -1 : 0; // The dev page doesn't contain the gmc/ part in the href, therefore the offset needs to be decreased by 1.
const gLangHrefOffset = 4 + gDevHrefOffset;
let gWindowLang = window.location.href.split("/")[gLangHrefOffset];
    gWindowLang = gWindowLang.length !== 2 ? "/" : gWindowLang;

window.addEventListener("DOMContentLoaded", _ => {
    gMarkCodeLineManager.setElement();
    gmcExpandNavigation();
    gmcExternalLinks();
    gmc404Redirect();
    gmcAddVersionToggle();
    gmcLinksForVersion();
    new MutationObserver(gmcSearchMutationCallback)
        .observe(document.querySelector(".md-search-result__list"), {childList: true});
});

window.addEventListener("hashchange", _ => {
    gMarkCodeLineManager.setElement();
})

function gmcAddClassToElement(className, element, elementName) {
    if (element.classList.contains(className)) {
        // gmcDebug(`⏩ Class '${className}' already present for ${elementName}`);
        return;
    }

    element.classList.add(className);
    // gmcDebug(`✅ Added '${className}' class to ${elementName}`);
}

function gmcExternalLinks() {
    const hostname = window.location.hostname;
    const domainParts = hostname.split('.');
    const githubId = domainParts[1] === "github" ? domainParts[0] : "gothic-modding-community";
    const repoUrl = `github.com/${githubId}`;

    // Regex to match urls starting with
    // https://$hostname
    // https://$repoUrl
    const regex = new RegExp(`^(?:https?:\/\/)?(${hostname}|${repoUrl})`, "i");
    const anchors = document.querySelectorAll(".md-content a");
    const className = "external-link";

    anchors.forEach( a => {
        if (a.href === "" || regex.test(a.href)) {
            // gmcDebug(`⏩ Regex matched for ${a.href} or is empty`);
            return;
        }

        a.setAttribute("target", "_blank");

        gmcAddClassToElement(className, a, a.href);
    });
}

function gmcExpandNavigation() {

    if (window.matchMedia("(max-width: 76.1875em)").matches) {
        // gmcDebug(`⏩ mobile doesn't expand`);
        return;
    }

    const activeNav = document.querySelector(".md-nav__link--active");

    if (activeNav === null || activeNav.parentElement === null) {
        return;
    }

    const children = activeNav.parentElement.querySelector("nav > ul").children;

    for (let i = 0; i < children.length; i++) {
        const toggle = children[i].querySelector('input[type="checkbox"]');

        if (!toggle) {
            // gmcDebug(`⏩ toggle not present`);
            continue;
        }

        if (toggle.checked) {
            // gmcDebug(`⏩ '${toggle.id}' already checked`);
            continue;
        }

        toggle.checked = true;
        // gmcDebug(`✅ Expanded '${toggle.id}'`);
    }
}

function gmc404Redirect() {
    const header = document.querySelector(".md-content h1");

    if (header === null) {
        return;
    }

    const href = window.location.href;

    if (header.innerHTML.includes("404") && href !== href.toLowerCase()) {
        window.location.replace(href.toLowerCase());
    }
}

const gmcSearchMutationCallback = (mutations, _) => {
    const originalHrefToElementMapping = new Set();
    const nodesForRemoval = [];

    for (const record of mutations) {
        for (const liNode of record.addedNodes) {
            for (const anchor of liNode.querySelectorAll("a")) {
                originalHrefToElementMapping.add(anchor.href);
            }
        }
    }

    for (const record of mutations) {
        for (const liNode of record.addedNodes) {
            let removeNode = false;
            for (const anchor of liNode.querySelectorAll("a")) {
                const hrefParts = anchor.href.split("/");
                const anchorLang = hrefParts[gLangHrefOffset];
                const anchorBaseLength = (anchorLang.length === 2 ? 6 : 5) + gDevHrefOffset;
                const anchorIsNotBase = anchor.href.split("/").length > anchorBaseLength;

                if (anchorLang.length === 2) {
                    if (anchorLang !== gWindowLang && anchorIsNotBase) {
                        removeNode = true;
                        // gmcDebug("removing localized duplicate", anchor.href);
                        break;
                    }
                } else if (gWindowLang !== "/") {
                    const newHref = `${hrefParts.slice(0, gLangHrefOffset).join("/")}/${gWindowLang}/${hrefParts.slice(gLangHrefOffset).join("/")}`;
                    if (originalHrefToElementMapping.has(newHref)) {
                        removeNode = true;
                        // gmcDebug("removing redundant", anchor.href);
                        break;
                    } else if (anchorIsNotBase) {
                        // gmcDebug("localizing href:", anchor.href);
                        anchor.href = newHref;
                    }
                }
            }
            if (removeNode)
                nodesForRemoval.push(liNode);
        }
    }

    for (const node of nodesForRemoval) {
        node.remove();
    }

    const amountDisplay = document.querySelector(".md-search-result__meta");
    const regex = /(\d+)/i;
    const regexResult = regex.exec(amountDisplay.textContent);
    const value = parseInt(regexResult ? regexResult[1] : "");
    const result = value - nodesForRemoval.length;
    amountDisplay.textContent = amountDisplay.textContent.replace(/\d+/i, result.toString());
};

const gmcAddVersionToggle = () => {

    const currentPath = window.location.pathname.replace("/gmc/", "/");

    const mdVersion = document.createElement("div");
    const mdVersionCurrent = document.createElement("button");
    const mdVersionList = document.createElement("ul");
    const mdVersionItemMain = document.createElement("li");
    const mdVersionLinkMain = document.createElement("a");
    const mdVersionItemDev = document.createElement("li");
    const mdVersionLinkDev = document.createElement("a");

    mdVersion.className = "md-version";
    mdVersionCurrent.className = "md-version__current";
    mdVersionList.className = "md-version__list";
    mdVersionItemMain.className = "md-version__item";
    mdVersionLinkMain.className = "md-version__link";
    mdVersionItemDev.className = "md-version__item";
    mdVersionLinkDev.className = "md-version__link";

    mdVersionCurrent.setAttribute("aria-label", gGMC_SELECT_VERSION);
    mdVersionCurrent.textContent = gGMC_LOCAL ? "LOCAL" : gGMC_DEV ? "dev" : "main";

    mdVersionLinkMain.textContent = "main";
    mdVersionLinkMain.href = `https://gothic-modding-community.github.io/gmc${currentPath}`;
    mdVersionLinkMain.setAttribute("title", `${gGMC_SELECT_VERSION} ${mdVersionLinkMain.textContent}`);

    mdVersionLinkDev.textContent = "dev";
    mdVersionLinkDev.href = `https://gmc.cokoliv.eu${currentPath}`;
    mdVersionLinkDev.setAttribute("title", `${gGMC_SELECT_VERSION} ${mdVersionLinkDev.textContent}`);

    mdVersionItemMain.appendChild(mdVersionLinkMain);
    mdVersionItemDev.appendChild(mdVersionLinkDev);
    mdVersionList.appendChild(mdVersionItemMain);
    mdVersionList.appendChild(mdVersionItemDev);
    mdVersion.appendChild(mdVersionCurrent);
    mdVersion.appendChild(mdVersionList);

    document.querySelector(".md-header__topic").appendChild(mdVersion);
};

const gmcLinksForVersion = () => {
    if (gGMC_DEV) {
        for (const anchor of document.querySelectorAll("a.md-source"))
            anchor.href = `${anchor.href}tree/dev`;

        const supportTranslation = document.querySelector(".gmc-announce a");
        if (supportTranslation)
            supportTranslation.href = supportTranslation.href.replace("/gmc/", "/");
    }

    for (const anchor of document.querySelectorAll("a.md-content__button")) {
        if (!gGMC_DEV && anchor.href.includes("/raw/"))
            continue;
        anchor.href = anchor.href.replace("/main/", "/dev/");
    }
};

function gmcDebug(...message) {
    if (gGMC_LOCAL)
        console.debug(...message);
}