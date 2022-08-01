"use strict";

let gGMC_DEBUG = false;

window.addEventListener("DOMContentLoaded", _ => {
    gmcExpandNavigation();
    gmcExternalLinks();
});

function gmcExternalLinks() {
    // Regex to match urls starting with
    // https://127.0.0.1
    // https://auronen ...
    // https://github.com/auronen ...
    const regex = /^(?:https?:\/\/)?(?:www)?(127\.0\.0\.1|auronen|github\.com\/auronen)/;
    const anchors = document.querySelectorAll(".md-content a");
    let className = "external-link";

    anchors.forEach( a => {
        if (regex.test(a.href)) {
            gmcDebug(`⏩ Regex matched for ${a.href}`);
            return;
        }

        a.setAttribute("target", "_blank");

        if (a.classList.contains(className)) {
            gmcDebug(`⏩ Class '${className}' already present for ${a.href}`);
            return;
        }

        a.classList.add(className);
        gmcDebug(`✅ Added '${className}' class to ${a.href}`);
    });
}

function gmcExpandNavigation() {
    const activeNav = document.querySelector(".md-nav__link--active").parentElement;
    const children = activeNav.querySelector("nav > ul").children;

    for (let i = 0; i < children.length; i++) {
        const toggle = children[i].querySelector('input[type="checkbox"]');

        if (!toggle) {
            gmcDebug(`⏩ toggle not present`);
            continue;
        }

        if (toggle.checked) {
            gmcDebug(`⏩ '${toggle.id}' already checked`);
            continue;
        }

        toggle.checked = true;
        gmcDebug(`✅ Expanded '${toggle.id}'`);
    }
}

function gmcDebug(message) {
    if (gGMC_DEBUG)
        console.debug(message);
}