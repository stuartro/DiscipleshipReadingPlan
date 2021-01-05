#!/bin/zsh
export PATH=/usr/local/bin:$PATH

swift build

TRANSLATION=ESVS
#TRANSLATION=KJVS
#TRANSLATION=NLT-SE

.build/debug/bibleReading \
              createThingsProject \
              --project-name "Bible Reading" \
              --bible-name-code "$TRANSLATION" \
              --start-month 1 \
              --end-month 1
