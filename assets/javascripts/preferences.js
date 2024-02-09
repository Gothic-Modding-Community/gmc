/*
 * Licence MIT - Copyright (c) 2024 Kamil Krzyśków (HRY)
 */

const gmcPreferenceHandler = (event) => {
    console.debug(event);
    const target = event.target;
    const option = target.dataset["option"];
    // preferencesKey defined in extrahead template override
    let loadedPreferences = __md_get(preferencesKey);
    if (!loadedPreferences[option]) {
        loadedPreferences[option] = {};
    }

    // TODO reconsider the OOP approach idea
    const optionHandlers = {
        "color": updateColorPreference,
        "custom": () => {
            loadedPreferences[option]["cssRaw"] = target.value;
        },
        "font": updateFontPreference,
    };

    if (optionHandlers[option]) {
        optionHandlers[option](option, target, loadedPreferences);
    } else {
        console.error("Unhandled option", option, target.value);
    }

    updateGlobalPreferences(loadedPreferences);
    __md_set(preferencesKey, loadedPreferences);
    // Function defined in extrahead template override
    gmcLoadSetPreferences();
};

const updateColorPreference = (option, target, loadedPreferences) => {
    const extra = target.dataset["extra"];
    const handle = loadedPreferences[option];
    if (extra === "reset") {
        loadedPreferences[option] = {};
        document.querySelector(`#preference-color-accent`).value = "#000000";
        document.querySelector(`#preference-color-hue`).value = "#000000";
        return;
    }
    // Credit: https://stackoverflow.com/questions/3732046/how-do-you-get-the-hue-of-a-xxxxxx-colour
    const hexColor = target.value;
    const red = parseInt(hexColor.substr(1, 2), 16);
    const green = parseInt(hexColor.substr(3, 2), 16);
    const blue = parseInt(hexColor.substr(5, 2), 16);
    let [hue, _, lightness] = rgbToHsl(red, green, blue);
    hue = Math.floor(hue * 360);
    lightness = Math.round(lightness * 240);

    const mod = 20;
    const redDarkerHex = Math.max(red - mod, 0).toString(16).padStart(2, "0");
    const greenDarkerHex = Math.max(green - mod, 0).toString(16).padStart(2, "0");
    const blueDarkerHex = Math.max(blue - mod, 0).toString(16).padStart(2, "0");
    const darkerColorHex = `#${redDarkerHex}${greenDarkerHex}${blueDarkerHex}`;

    if (!handle[extra]) {
        handle[extra] = {};
    }

    handle[extra]["value"] = target.value;
    if (extra === "hue") {
        handle[extra]["calculatedHue"] = hue;
    } else if (extra === "accent") {
        handle[extra]["darker"] = darkerColorHex;
        handle[extra]["calculatedHue"] = hue;
    }

    handle["cssRaw"] = "*, :before, :after { ";
    if (handle["hue"]) {
        handle["cssRaw"] += `--md-hue: ${handle["hue"]["calculatedHue"]}deg;`;
    }
    if (handle["accent"]) {
        handle["cssRaw"] += `--gmc-tabs-bg-hue: ${handle["accent"]["calculatedHue"]}deg;`;
        handle["cssRaw"] += `--md-accent-fg-color: ${handle["accent"]["value"]};`;
        handle["cssRaw"] += `--md-accent-fg-color--transparent: ${handle["accent"]["value"]}1a;`;
        handle["cssRaw"] += `--md-typeset-a-color: ${handle["accent"]["darker"]};`
        if (lightness > 120) {
            handle["cssRaw"] += "--md-accent-bg-color: #000000de;";
            handle["cssRaw"] += "--md-accent-bg-color--light: #0000008a;"
        } else {
            handle["cssRaw"] += "--md-accent-bg-color: #fff;";
            handle["cssRaw"] += "--md-accent-bg-color--light: #ffffffb3;"
        }
    }
    handle["cssRaw"] += " }\n";
}

const updateFontPreference = (option, target, loadedPreferences) => {
    const handle = loadedPreferences[option];
    handle["value"] = target.value;
    handle["cssRaw"] = "";

    if (target.value === "opendyslexic") {
        // Due to the JavaScript CSS injection -> Import Fetch there is a delay
        // when it comes to enabling the custom font. The default font flashes for a second or 2.
        // Only fix for this would be to remove the import and inject the CSS font file directly,
        // however that is not ideal either.
        handle["cssRaw"] += `@import url('https://fonts.cdnfonts.com/css/opendyslexic');
            :root { --md-text-font: "OpenDyslexic"; --md-code-font: "OpenDyslexicMono"; }`;
    }
    // Initial attempt that didn't work due to CORS, but is valid for adding CSS based on the font URLs.
    // Doesn't handle TTF or OTF fonts, only WOFF/2.
    // if (target.value === "opendyslexic") {
    //     const fontUrls = [
    //         "https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Regular.woff2",
    //         "https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Italic.woff2",
    //         "https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Bold.woff",
    //         "https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Bold-Italic.woff2",
    //     ];
    //     for (const url of fontUrls) {
    //         const fileName = url.split("/").pop();
    //         const fontName = fileName.split("-")[0];
    //         const formatName = fileName.split(".").pop();
    //         let currentFont = `@font-face { font-family: "${fontName}"; `;
    //         if (fontName.toLowerCase().includes("bold")) {
    //             currentFont += "font-weight: bold; ";
    //         }
    //         if (fontName.toLowerCase().includes("bold")) {
    //             currentFont += "font-style: italic; ";
    //         }
    //         currentFont += `src: local("${fontName}"), url("${url}") format("${formatName}"); }\n`
    //         handle["cssRaw"] += currentFont;
    //     }
    //     handle["cssRaw"] += ':root { --md-text-font: "OpenDyslexic"; }'
    // }
}

const updateGlobalPreferences = (loadedPreferences) => {
    loadedPreferences["__global"]["cssRaw"] = "";

    const imports = [];
    for (let key in loadedPreferences) {
        if (key === "__global" || !loadedPreferences[key]["cssRaw"]) continue;
        const lines = loadedPreferences[key]["cssRaw"].split("\n");
        for (const line of lines) {
            if (line.includes("@import")) {
                imports.push(line);
            } else {
                loadedPreferences["__global"]["cssRaw"] += line + "\n";
            }
        }
    }

    if (imports) {
        loadedPreferences["__global"]["cssRaw"] = imports.join("\n") + "\n" + loadedPreferences["__global"]["cssRaw"];
    }
}

/**
 * Removes the translation prompts from the page.
 * Mostly a quick hack for the GMC Preferences page.
 * Once this function is used more than 3 times,
 * it would be better to have a backend preprocessor solution.
 */
const removeRedundantTranslationIndicator = () => {
    // TODO backend preprocessor solution
    const itemsToRemove = [
        document.querySelector("#gmc-new-translation-button"),
        document.querySelector(".gmc-announce")
    ];

    for (const item of itemsToRemove) {
        // console.debug(item);
        if (item) {
            item.remove();
        }
    }
};

/*
    This is run immediately when loaded to limit UI elements flashing.
*/
(() => {

    // Defined in extrahead template override
    gGMC_REMOVE_TRANSLATION_PROMPTS = true;
    removeRedundantTranslationIndicator();

    const loadedPreferences = __md_get(preferencesKey);
    const options = ["color-accent", "color-hue", "color-reset", "font", "custom"];

    for (const option of options) {
        const el = document.querySelector(`#preference-${option}`);
        const split = option.split("-");
        const handle = loadedPreferences[option];
        if (handle) {
            const value = handle["value"] || handle["cssRaw"];
            if (value) {
                el.value = value;
            }
        } else if (split.length === 2 && loadedPreferences[split[0]] && loadedPreferences[split[0]][split[1]]) {
            const value = loadedPreferences[split[0]][split[1]]["value"];
            if (value) {
                el.value = value;
            }
        }
        if (el.tagName.toLowerCase() === "a") {
            el.addEventListener("click", gmcPreferenceHandler);
        } else {
            el.addEventListener("change", gmcPreferenceHandler);
        }
    }

})();

/**
 * Converts an RGB color value to HSL. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
 * Assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and l in the set [0, 1].
 *
 * Credit: https://gist.github.com/mjackson/5311256
 *
 * @return  Array The HSL representation
 * @param r
 * @param g
 * @param b
 */
function rgbToHsl(r, g, b) {
    r /= 255;
    g /= 255;
    b /= 255;

    const max = Math.max(r, g, b), min = Math.min(r, g, b);
    let h, s, l = (max + min) / 2;

    if (max === min) {
        h = s = 0; // achromatic
    } else {
        const d = max - min;
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);

        switch (max) {
            case r:
                h = (g - b) / d + (g < b ? 6 : 0);
                break;
            case g:
                h = (b - r) / d + 2;
                break;
            case b:
                h = (r - g) / d + 4;
                break;
        }

        h /= 6;
    }

    return [h, s, l];
}