#! /bin/sh

DOCS_OUTPUT_PATH="docs/lint"

## Check that script is run from 
SWIFT_PACKAGE="Package.swift"
if [ ! -f "$SWIFT_PACKAGE" ]; then
    echo "Script should be run from the directory where $SWIFT_PACKAGE exists."
    echo "run as: ./.script/03.report-swift-lint.sh"
    exit -1
fi

## Create doc
mkdir -p $DOCS_OUTPUT_PATH
swiftlint lint --quiet --reporter html > $DOCS_OUTPUT_PATH/index.html