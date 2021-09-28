#!/bin/zsh
export PATH=/usr/local/bin:$PATH

swift build

TRANSLATION_ACCORD=ESVS
TRANSLATION_LOGOS=ESV
#TRANSLATION=CSB17S
#TRANSLATION=KJVS
#TRANSLATION=NLT-SE

.build/debug/bibleReading \
              createThingsProject \
              --project-name "Bible Reading" \
              --bible-name-code-accord "$TRANSLATION_ACCORD" \
              --bible-name-code-logos "$TRANSLATION_LOGOS" \
              --start-month 1 \
              --end-month 12


