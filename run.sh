#!/bin/zsh
export PATH=/usr/local/bin:$PATH

swift build
.build/debug/bibleReading \
              createThingsProject \
              --project-name "Bible Reading" \
              --bible-name-code "NLT-SE" \
              --start-month 1 \
              --end-month 1
