"use strict";

let gGMC_DEBUG = false;

window.addEventListener("DOMContentLoaded", _ => {
    gmcExternalLinks();
});

function gmcExternalLinks() {
    const hostname = window.location.hostname;
    const domainParts = hostname.split('.');
    const githubId = domainParts[1] === "github" ? domainParts[0] : "auronen";
    const repoUrl = `github.com/${githubId}`;

    // Regex to match urls starting with
    // https://$hostname
    // https://$repoUrl
    const regex = new RegExp(`^(?:https?:\/\/)?(${hostname}|${repoUrl})`);
    const anchors = document.querySelectorAll(".md-content a");
    const className = "external-link";

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

function gmcDebug(message) {
    if (gGMC_DEBUG)
        console.debug(message);
}