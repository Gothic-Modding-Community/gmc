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

const gGMC_LOCAL = window.location.hostname === "127.0.0.1" || window.location.hostname === "localhost";
const gGMC_DEV = window.location.hostname.toLowerCase() !== "gothic-modding-community.github.io" && !gGMC_LOCAL;
const gMarkCodeLineManager = new MarkCodeLineManager();
const MutationObserver = window.MutationObserver || window.WebKitMutationObserver;

window.addEventListener("DOMContentLoaded", _ => {
    gMarkCodeLineManager.setElement();
    gmc404Redirect();
    gmcExpandNavigation();
    gmcAddVersionToggle();
    gmcLinksForVersion();
    if (gGMC_PAGE_LOCALE !== "en" && gGMC_PAGE_LOCALE !== gGMC_PAGE_FILE_LOCALE) {
        gmcTranslateButton();
    }
    gmcExternalLinks();
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

    const activeLink = document.querySelector(".md-nav__link--active");

    if (!activeLink) {
        return;
    }

    let activeNav = activeLink.parentElement.querySelector("nav");

    if (!activeNav) {
        activeNav = activeLink.closest("nav");
    }

    const children = activeNav.querySelector("ul").children;

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

    // gmcDebug("Running mutations")

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
                const langHrefOffset = 4;
                const anchorLocale = hrefParts[langHrefOffset];
                const anchorBaseLength = (anchorLocale.length === 2 ? 6 : 5);
                const anchorIsBase = anchor.href.split("/").length <= anchorBaseLength;

                if (anchorLocale.length === 2 && anchorLocale !== gGMC_PAGE_LOCALE && !anchorIsBase) {
                    removeNode = true;
                    // gmcDebug("removing localized duplicate", anchor.href);
                    break;
                } else if (gGMC_PAGE_LOCALE !== "en") {
                    const newHref = `${hrefParts.slice(0, langHrefOffset).join("/")}/${gGMC_PAGE_LOCALE}/${hrefParts.slice(langHrefOffset).join("/")}`;
                    // gmcDebug(`Generated href: ${newHref}`)
                    if (anchorIsBase) {
                        // gmcDebug("keeping base anchor: ", anchor.href);
                    } else if (originalHrefToElementMapping.has(newHref)) {
                        removeNode = true;
                        // gmcDebug("removing redundant", anchor.href);
                        break;
                    } else {
                        // gmcDebug("localizing href:", anchor.href);
                        anchor.href = newHref;
                    }
                }
                // else {
                //     gmcDebug("keeping normal anchor: ", anchor.href);
                // }
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

    const currentPath = window.location.pathname;

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
    mdVersionLinkMain.href = `https://gothic-modding-community.github.io${currentPath}`;
    mdVersionLinkMain.setAttribute("title", `${gGMC_SELECT_VERSION} ${mdVersionLinkMain.textContent}`);

    mdVersionLinkDev.textContent = "dev";
    mdVersionLinkDev.href = `https://auronen.cokoliv.eu${currentPath}`;
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

const gmcTranslateButton = () => {
    const anchor = document.querySelectorAll("a.md-content__button")[0];
    const hrefParts = anchor.href.split("/");
    const oldFileName = hrefParts.pop();
    const newFileName = oldFileName.replace(".md", `.${gGMC_PAGE_LOCALE}.md`);
    const topDirectory = hrefParts.pop();
    const newURLBase = hrefParts.join("/").replace("/edit/", "/new/");
    const fileNameParam = encodeURIComponent(`${topDirectory}/${newFileName}`);
    const messageFileName = oldFileName === "index.md" ? `${topDirectory}/index.md` : oldFileName;
    const messageParam = encodeURIComponent(`Add \`${gGMC_PAGE_LOCALE}\` translation for \`${messageFileName}\``);
    const valueParam = encodeURIComponent([
        "Open the `Preview` tab to display with better formatting.",
        "## Overview",
        "This method of translation is for those that don't want to set up the project files.",
        "The file name and commit message are already set, best not to change them.",
        "Due to technical limitations you need to copy the English base contents yourself.",
        "Before you do that please make sure that:",
        "",
        "- there are no open [Issues](https://github.com/Gothic-Modding-Community/gmc/issues) concerning the same files,",
        "- there are no open [Pull Requests](https://github.com/Gothic-Modding-Community/gmc/pulls) concerning the same files,",
        "- `Spaces` and `4` are selected in the upper right corner of the editor in the `Edit new file` tab,",
        "- you've read our [contribution guidelines](https://gothic-modding-community.github.io/gmc/contribute/).",
        "",
        "---",
        "",
        "### English File",
        "Here is the link to the English file:",
        anchor.href.replace("/edit/", "/raw/"),
        "Copy the contents and in the `Edit new file` tab, replace these instructions with them.",
        "",
        "#### *Note*",
        "*Please note that this page **won't** preserve your changes in real time like Google Docs.*",
        "*Until you press the green button below nothing will be saved, so be sure not to lose progress.*",
    ].join("  \n"));
    const newAnchor = document.createElement("a");
    newAnchor.classList = anchor.classList;
    // Weird quirk. The topDirectory needs to be in both, the link and in the filename param to put the file in the correct directory.
    newAnchor.href = `${newURLBase}/${topDirectory}?filename=${fileNameParam}&message=${messageParam}&value=${valueParam}`;
    newAnchor.innerHTML = gGMC_TRANSLATE_SVG;
    newAnchor.title = gGMC_TRANSLATE_CTA;
    anchor.parentElement.prepend(newAnchor);
}

function gmcDebug(...message) {
    if (gGMC_LOCAL)
        console.debug(...message);
}