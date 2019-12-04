# Autohotkey-scripts
Autohotkey (AHK) scripts written for various purposes by mslonik. My web page: http://mslonik.pl.

## MicrosoftWord_MacroKeyboard

## NumpadMouse

## Otagle
Description available at AHK forum: https://www.autohotkey.com/boards/viewtopic.php?t=69690
YouTube video dedicated to this solution: https://youtu.be/5zKbTOXBqEs

This is a proof of the following concept: free (as in freedom) solution analogue to commercially available “elgato stream deck” (https://www.elgato.com/en/gaming/stream-deck).

The components:
* Hardware:
  * LCD combined with a touchscreen designed for Raspberry Pi, resolution: 1024 x 600 pixels.
      * Acrylic frame with nice brackets.
* Software:
  * Installed Autohotkey (AHK) language interpreter.
    * Script called OTAGLE as anagram to “elgato” (etymology: “a cat” in Spanish).

## PolishDiactric
Enable input of diacritic / diactric letters (https://en.wikipedia.org/wiki/Diacritic)  without touching of AltGr (right Alt key). 

In some countries, e.g. Poland, there is no country specific keyboard layout, instead a "programmers keyboard" is used. Instead the default "latin" keboard layout is applied, but right Alt key (AltGr) if pressed prior to a key for which diactric exists, then such key code is entered (see https://en.wikipedia.org/wiki/AltGr_key#Polish for further details). In situation when AltGr is not located conveniently or ones thumb is aking / disabled, this could be cumbersome.

Thanks to this script it is possible to enter diactric keys instead of usage of AltGr:
* double press a key corresponding to specific diacritic key, e.g. ee converts into ę;
* AltGr toggles SUSPEND of this script (if on, keyboard acts as default, if off see above line);
* special sequence for double letters within words: <letter><letter><letter>, e.g. zaaawansowany converts into zaawansowany

To sum up:
* e -> e
* ee -> ę
* eee -> ee

Why this script was prepared:
a. "programmers keyboard" and Polish diactric marks combined with old ANSI 101 keys keyboards (without Windows key and context key) where AltGr is unergonomically shifted to the right side of keyboard,
b. all other "programmers keyboard" when one doesn't want to press AltGr.

The "PolishDiactric" contains the following 4 scripts. It's recommended to use by default PolishDiacritic2.ahk only. The other scripts are left for educational purposes mainly.

* PolishDiacritic1.ahk <- the 1st attempt to fulfill above requirements; 
  - e -> e
  - ee -> ę
  - e  e -> ee

* PolishDiacritic2.ahk
  - e -> e
  - ee -> ę
  - eee -> ee
  Information about this particular script at AHK forum: https://www.autohotkey.com/boards/viewtopic.php?t=67840

* PolishDiacritic3.ahk <- variant of above, but instead of hotstrings attempt to carry on with input buffers
  - e -> e
  - ee -> ę
  - eee -> ee

* PolishDiacritic4.ahk <- variant of above, attempt to apply arrays; not finished.
  - e -> e
  - ee -> ę
  - eee -> ee
