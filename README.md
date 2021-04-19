# Posh-Say

## Installation
- `. .\Start-TTS.ps1` to import the function
- `Start-TTS [args]` to use

## Features
- `Voice` parameter: choose 0, 1 or 2 to change the voice (the result depends on the languages installed on your computer)
- `AlternativeVoice` switch: shortcut to `-Voice 1`. Overwrites the `Voice` parameter
- `Rate` parameter: modifies the speed at which the text is spoken. A positive number results in a faster voice, whereas a negative number will slow the voice down.

## Usage
- `Start-TTS <text>` for single word/string tts
- `Start-TTS` to enter multiple word-mode (`Enter` to confirm text, `Enter` without text to exit)
