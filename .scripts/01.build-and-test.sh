#! /bin/sh

# Install:
#  - Place this file next to the Package.swift in your project
#  - Open a terminal and cd to the project directory
#  - Run: brew install lcov
#  - Run: chmod +x coverage.sh
#
# Usage:
#  Run: ./coverage.sh
#  Command click the HTML output path to open the coverage report in your browser
#

# Check that script is run from 
SWIFT_PACKAGE="Package.swift"
if [ ! -f "$SWIFT_PACKAGE" ]; then
    echo "Script should be run from the directory where $SWIFT_PACKAGE exists."
    echo "run as: ./.script/01.build-and-test.sh"
    exit -1
fi

CONFIGURATION="debug"
COVERAGE_BUILD_PATH=".build/coverage-build"

# Clean
rm -r $COVERAGE_BUILD_PATH $COVERAGE_OUTPUT_PATH 2>/dev/null
swift package clean

# Build
swift build --enable-code-coverage -c $CONFIGURATION --build-path $COVERAGE_BUILD_PATH

# Test
swift test --enable-code-coverage -c $CONFIGURATION --build-path $COVERAGE_BUILD_PATH
