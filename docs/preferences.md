---
preferences_i18n:
    en:
        page-title: "Preferences"
        page-description: "This page allows to set various preferences for reading the docs:"
        color-title: "Color"
        color-description: "You can change the feel of the site with a color change."
        color-input-accent-title: "Select accent color"
        color-input-hue-title: "Select hue color"
        color-button-reset: "Reset colors"
        custom-title: "Custom CSS"
        custom-description: "You can add custom stylesheets."
        custom-textarea-title: "Input CSS"
        font-title: "Font"
        font-description: "You can change the font to another preset."
        font-selection-title: "Select font"
        font-selection-default: "Default"
        font-selection-opendyslexic: "OpenDyslexic"
        heading-shadows-title: "Heading shadows"
        heading-shadows-description: "You can enable additional shadows for the heading to make them appear more bold."
    pl:
        page-title: "Preferencje"
        page-description: "Ta strona pozwala ustawić różne preferencje do czytania dokumentacji:"
        color-title: "Kolor"
        color-description: "Możesz zmienić nastrój strony poprzez zmianę koloru."
        color-input-accent-title: "Wybierz kolor akcentujący"
        color-input-hue-title: "Wybierz kolor odcienia"
        color-button-reset: "Zresetuj kolory"
        custom-title: "Własny CSS"
        custom-description: "Możesz dodać niestandardowe arkusze stylów."
        custom-textarea-title: "Wprowadź CSS"
        font-title: "Czcionka"
        font-description: "Możesz zmienić czcionkę na predefiniowany."
        font-selection-title: "Wybierz czcionkę"
        font-selection-default: "Domyślna"
        font-selection-opendyslexic: "OpenDyslexic"
        heading-shadows-title: "Cienie nagłówków"
        heading-shadows-description: "Możesz włączyć dodatkowe cienie do nagłówków żeby wyglądały bardziej pogrubione."
---
# {{ page-title }}

{{ page-description }}

## {{ color-title }}

{{ color-description }} 

<label for="preference-color-accent">{{ color-input-accent-title }}:</label> 
<input 
    data-option="color"
    data-extra="accent"
    id="preference-color-accent"
    name="preference-color-accent"
    title="{{ color-input-accent-title }}" 
    type="color">

<label for="preference-color-hue">{{ color-input-hue-title }}:</label> 
<input 
    data-option="color"
    data-extra="hue"
    id="preference-color-hue"
    name="preference-color-hue"
    title="{{ color-input-hue-title }}" 
    type="color">

[{{ color-button-reset }} :fontawesome-regular-circle-xmark:](#preference-color-reset){ #preference-color-reset .md-button data-extra="reset" data-option="color" title="{{ color-button-reset }}" }

## {{ font-title }}

{{ font-description }} 

<label for="preference-font">{{ font-selection-title }}:</label> 
<select data-option="font" id="preference-font" name="preference-font" title="{{ font-selection-title }}">
    <option value="default">{{ font-selection-default }}</option>
    <option value="opendyslexic">{{ font-selection-opendyslexic }}</option>
</select>

## {{ custom-title }}

{{ custom-description }} <label for="preference-custom">{{ custom-textarea-title }}:</label>
<p>
<textarea 
    class="md-input--stretch" 
    data-option="custom"
    id="preference-custom"
    name="preference-custom"
    style="resize: none; height: 10em"
    title="{{ custom-textarea-title }}">
</textarea>
</p>

<script src="/gmc/assets/javascripts/preferences.js"></script>