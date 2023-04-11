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
const gGMC_DEFAULT_LOCALE = "en";
const gMarkCodeLineManager = new MarkCodeLineManager();
const gMutationObserver = window.MutationObserver || window.WebKitMutationObserver;

window.addEventListener("DOMContentLoaded", _ => {
    gMarkCodeLineManager.setElement();
    gmc404Redirect();
    gmcFadingNavigation();
    gmcExpandNavigation();
    gmcAddVersionToggle();
    gmcLinksForVersion();
    if (gGMC_PAGE_LOCALE !== gGMC_DEFAULT_LOCALE && gGMC_PAGE_LOCALE !== gGMC_PAGE_FILE_LOCALE) {
        gmcTranslateButton();
    }
    gmcRemoveCodeLines();
    gmcExternalLinks();
    new gMutationObserver(gmcSearchMutationCallback)
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

    if (!activeNav || activeNav.className.includes("md-nav--secondary")) {
        // gmcDebug(`nav not foundInParent`);
        activeNav = activeLink.closest("nav");
    }

    if (activeNav.dataset.hasOwnProperty("mdLevel")) {
        if (activeNav.dataset.mdLevel < 2) {
            // gmcDebug(`nav level too low, not expanding`);
            return;
        }
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

    // gmcDebug("Running mutations");

    for (const record of mutations) {
        for (const liNode of record.addedNodes) {
            for (const anchor of liNode.querySelectorAll("a")) {
                originalHrefToElementMapping.add(anchor.href);
                // gmcDebug("initial mutation: ", anchor.href);
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
                    /*
                    * This case happens when a search result link has a different locale than the current one.
                    * Being on CS version and searching for something, PL result shows up and gets removed.
                    * By design choice we keep the Base links to allow locale switching via searching for the Base locale link.
                    */
                    // gmcDebug("removing different localization", anchor.href);
                    removeNode = true;
                    break;
                } else if (gGMC_PAGE_LOCALE !== gGMC_DEFAULT_LOCALE) {
                    if (anchorIsBase) {
                        // By design choice we keep the Base links to allow locale switching via searching for the Base locale link.
                        // gmcDebug("keeping base href:", anchor.href);
                        continue;
                    }

                    if (anchorLocale === gGMC_PAGE_LOCALE) {
                        // gmcDebug("keeping href for the current locale:", anchor.href);
                        continue;
                    }

                    const leftChunk = hrefParts.slice(0, langHrefOffset).join("/");
                    const rightChunk = hrefParts.slice(langHrefOffset).join("/");
                    const newHref = `${leftChunk}/${gGMC_PAGE_LOCALE}/${rightChunk}`;
                    // gmcDebug(`Parts: ${hrefParts} ;`, `Left: ${leftChunk} ;`, `Right: ${rightChunk}`);
                    // gmcDebug(`Generated href: ${newHref}`);

                    if (originalHrefToElementMapping.has(newHref)) {
                        /*
                        * This case happens when there is a localized page and default language page in the same search.
                        * Being on PL searching for Talent, shows both the PL and EN site.
                        * Since we have the PL site we delete the EN.
                        */
                        removeNode = true;
                        // gmcDebug("removing not localized duplicate:", anchor.href);
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
    const indexFileHint = oldFileName === "index.md" ? `In case of \`index.md\`, yes, keep the \`${topDirectory}/\` part in the commit message.\n` : "";
    const messageFileName = oldFileName === "index.md" ? `${topDirectory}/index.md` : oldFileName;
    const messageRaw = `Add \`${gGMC_PAGE_LOCALE}\` translation for \`${messageFileName}\``;
    const messageRawEscaped = messageRaw.replaceAll("`", "\\`");
    const messageParam = encodeURIComponent(messageRaw);
    const valueParam = encodeURIComponent([
        "Open the `Preview` tab to display with better formatting.",
        "## Overview",
        "This method of translation is for those that don't want to set up the project files.",
        "Due to technical limitations you need to copy the English base contents yourself.",
        "Before you do that please make sure that:",
        "",
        "- there are no open [Issues](https://github.com/Gothic-Modding-Community/gmc/issues) concerning the same files,",
        "- there are no open [Pull Requests](https://github.com/Gothic-Modding-Community/gmc/pulls) concerning the same files,",
        "- `Spaces` and `4` are selected in the upper right corner of the editor in the `Edit` tab,",
        "- you've read our [contribution guidelines](https://gothic-modding-community.github.io/gmc/contribute/).",
        "",
        "---",
        "",
        ":exclamation: :warning: :exclamation:",
        "",
        "The file name and commit message should be already set, however due to the new GitHub UI the behavior has changed.",
        "Assure that:",
        `- the file name above is set to \`${newFileName}\` without the \`${topDirectory}/\` part in the \`Edit\` tab,`,
        `- before committing changes, the message is set to: **${messageRawEscaped}**`,
        `It will later look like this: ${messageRaw}`,
        indexFileHint,
        ":exclamation: :warning: :exclamation:",
        "",
        "---",
        "",
        "### English File",
        "Here is the link to the English file:",
        anchor.href.replace("/edit/", "/raw/"),
        "Copy the contents and in the `Edit` tab, replace these instructions with them.",
        "",
        "#### Hint",
        "*Please note that this page **won't** preserve your changes in real time like Google Docs.*",
        "*Until you `Commit` the changes using the green button nothing will be saved, so be sure not to lose progress.*",
        "",
        "#### Hint",
        "*GitHub's file editor doesn't provide `.md` formatting options, if you want those, consider using https://stackedit.io/*",
    ].join("  \n"));
    const newAnchor = document.createElement("a");
    newAnchor.classList = anchor.classList;
    // Weird quirk. The topDirectory needs to be in both, the link and in the filename param to put the file in the correct directory.
    // -- This quirk stopped quirking with the introduction of the new GitHub UI, sadge.
    newAnchor.href = `${newURLBase}/${topDirectory}?filename=${fileNameParam}&message=${messageParam}&value=${valueParam}`;
    newAnchor.innerHTML = gGMC_TRANSLATE_SVG;
    newAnchor.title = gGMC_TRANSLATE_CTA;
    anchor.parentElement.prepend(newAnchor);
}

const gmcRemoveCodeLines = () => {
    const nodesForRemoval = [];
    const lineContainers = document.querySelectorAll(".highlighttable .linenos");
    for (const container of lineContainers) {
      let lines = container.querySelectorAll("span.normal")
      if (lines.length < 3) {
        nodesForRemoval.push(container);
      }
    }
    for (const container of nodesForRemoval) {
      container.remove();
    }
};

const gmcFadingNavigation = () => {
    const activeNavItems = document.querySelectorAll(".md-nav__item--active.md-nav__item--nested");

    if (activeNavItems.length <= 1)
        return;

    activeNavItems[0].classList.add("gmc-fade-nav");
    activeNavItems[activeNavItems.length - 1].classList.add("gmc-fade-nav-off");
}

function gmcDebug(...message) {
    if (gGMC_LOCAL)
        console.debug(...message);
}