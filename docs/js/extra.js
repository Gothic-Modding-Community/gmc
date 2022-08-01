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
    const toggles = activeNav.querySelectorAll('input[type="checkbox"]');
    toggles.forEach( t => {
        if (t.checked) {
            gmcDebug(`⏩ ${t.id} already checked`);
            return;
        }

        t.checked = true;
        gmcDebug(`✅ Expanded '${t.id}'`);
    })
}

function gmcDebug(message) {
    if (gGMC_DEBUG)
        console.debug(message);
}