#!/bin/zsh
export PATH=/usr/local/bin:$PATH

swift build

.build/debug/bibleReading \
              generateMarkdown \
              --title "Bible Reading" \
              --bible-name-code "NLT-SE" \
              --start-month 1 \
              --end-month 12 > readingPlans/discipleShipReadingPlan_ESVS.md

.build/debug/bibleReading \
              generateMarkdown \
              --title "Bible Reading" \
              --bible-name-code "NLT-SE" \
              --start-month 1 \
              --end-month 12 > readingPlans/discipleShipReadingPlan_KJVS.md

.build/debug/bibleReading \
              generateMarkdown \
              --title "Bible Reading" \
              --bible-name-code "NLT-SE" \
              --start-month 1 \
              --end-month 12 > readingPlans/discipleShipReadingPlan_NLT-SE.md
