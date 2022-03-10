#! /bin/sh


## Constants
VOSTOK_FILE="projectInfo.vostok"

LIBRARY_TEMPLATE_NAME="LibraryTemplate"
LIBRARY_TEMPLATE_PODSPEC="${LIBRARY_TEMPLATE_NAME}.podspec"
LIBRARY_TEMPLATE_TEST_FILE="Tests/${LIBRARY_TEMPLATE_NAME}Tests/LibraryTests.swift"
LIBRARY_TEMPLATE_RESOURCE_BUNDLE="${LIBRARY_TEMPLATE_NAME}_${LIBRARY_TEMPLATE_NAME}"
LIBRARY_TEMPLATE_GITHUB_PAGE_URL="https://santander-group-spain\.github\.io/march-mobile-ios_library_template/"
LIBRARY_TEMPLATE_HTTPS_URL="https://github\.com/santander-group-spain/march-mobile-ios_library_template\.git"
LIBRARY_TEMPLATE_SSH_URL="git@github\.com:santander-group-spain/march-mobile-ios_library_template\.git"
LIBRARY_TEMPLATE_GITHUB_URL="https://github\.com/santander-group-spain/march-mobile-ios_library_template"
RESOURCE_BUNDLE_HELPER="Sources/${LIBRARY_TEMPLATE_NAME}/ResourceHelper.swift"

logProcess() {
    echo "\033[38;5;034m$*
    \033[0m"
}

logError() {
    echo "\033[38;5;196m$*
    \033[0m"
}

echo "
\033[38;5;034m                                                                   @@
\033[38;5;034m                                                               @@@@@@
\033[38;5;034m                                                            @@@@@@@@
\033[38;5;034m                                                          @@@@@@@@@@
\033[38;5;034m                                                         @@@@@@@@@@
\033[38;5;034m                                                        @@@@@@@@@@
\033[38;5;034m                                                        @@@@@@@@
\033[38;5;034m                                                       @@@@@@
\033[38;5;034m                                                       @@
\033[38;5;034m                                      @@@@@@@@@@@@        @@@@@@@@@@@@@@@
\033[38;5;034m                                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;034m                                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;034m                               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;226m                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;226m                             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;226m                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;226m                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;208m                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;208m                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;208m                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;208m                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;196m                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;196m                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;196m                             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;196m                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;129m                               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;129m                                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;129m                                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;129m                                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;038m                                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;038m                                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;038m                                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\033[38;5;038m                                         @@@@@@@@@          @@@@@@@@@
\033[0m"
echo ""
echo "
\033[38;5;196m                               Library template created by MArch Mobile Team
\033[38;5;196m                               =============================================
\033[0m"

# Check that script is run from 
SWIFT_PACKAGE="Package.swift"
if [ ! -f "$SWIFT_PACKAGE" ]; then
    logError "Script should be run from the directory where $SWIFT_PACKAGE exists."
	logError "run as: ./.script/00.setup-library.sh"
    exit -1
fi

# Has swiftlint?
export PATH=/usr/local/bin:/opt/homebrew/bin:$PATH
SWIFTLINT=$(which swiftlint)
if [[ ! -e "${SWIFTLINT}" ]]; then
	logError "SwiftLint is not present in your environment, download from https://github.com/realm/SwiftLint"
	exit 1
fi

grep -q "\"$LIBRARY_TEMPLATE_NAME\"" "$VOSTOK_FILE"
if [[ ! $? -eq 0 ]] ; then
	logError "Project seems to be already setup. If this is an error, please report it."
    exit 1
fi

# Has cocoapods?
SWIFTLINT=$(which pod)
if [[ ! -e "${SWIFTLINT}" ]]; then
	logError "Cocoapods is not present in your environment, follow the installation instructions from https://cocoapods.org"
	exit 1
fi

trimString() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   
    echo "$var"
}

## Set library configuration
LIBRARY_ORIGIN="$(git config --get remote.origin.url)"
LIBRARY_NAME=""
LIBRARY_SSH_URL=""
LIBRARY_HTTPS_URL=""
LIBRARY_GITHUB_PAGE_URL=""
LIBRARY_GITHUB_URL=""
LIBRARY_VERSION=""
LIBRARY_RESOURCE_BUNDLE=""

### Enable (local) git hooks
logProcess "Setting up GitHooks..."
git config core.hooksPath .githooks


### Set repo URL (ssh and https)
if [[ $LIBRARY_ORIGIN == git* ]]; then
	LIBRARY_SSH_URL=$LIBRARY_ORIGIN
	LIBRARY_HTTPS_URL=$(git remote get-url origin | sed -E 's,^git@([^:]*):/*(.*)$,https://\1/\2,')
else
	LIBRARY_HTTPS_URL=$LIBRARY_ORIGIN
	LIBRARY_SSH_URL=$(git remote get-url origin | sed -E 's,^https://([^/]*)/(.*)$,git@\1:\2,')
fi

REPOSITORY_REGEX="^(https|git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+)(.git)*$"
if [[ "$LIBRARY_HTTPS_URL" =~ $REPOSITORY_REGEX ]]; then
    protocol=${BASH_REMATCH[1]}
    separator=${BASH_REMATCH[2]}
    hostname=${BASH_REMATCH[3]}
    user=${BASH_REMATCH[4]}
    repo=${BASH_REMATCH[5]}
	github_io_url="https://$user.github.io/$repo"
	suffix=".git"

	LIBRARY_GITHUB_PAGE_URL="${github_io_url/%$suffix}/"
    LIBRARY_GITHUB_URL="${LIBRARY_HTTPS_URL/%$suffix}"
fi

echo "
\033[38;5;038mEnter the Library name without spaces (i.e.: STCertificatePinning, STUIKit, STSecurityKit).
\033[38;5;038mThis will also be the Target and Product name of the Swift library.
\033[0m"
read LIBRARY_NAME
LIBRARY_NAME="$(trimString "$LIBRARY_NAME")"

echo "
\033[38;5;038mEnter the initial version of your Library in SemVer format (x.y.z)
\033[0m"
read LIBRARY_VERSION
LIBRARY_VERSION="$(trimString "$LIBRARY_VERSION")"

## Confirm setup
echo "
\033[38;5;034m====== Configuration to apply ======
Please verify that the following information is correct

\033[38;5;208mLibrary name:\033[0m '$LIBRARY_NAME'
\033[38;5;208mLibrary initial version:\033[0m '$LIBRARY_VERSION'
\033[38;5;208mLibrary homepage url:\033[0m '$LIBRARY_GITHUB_URL'
\033[38;5;208mLibrary repository url (SSH):\033[0m '$LIBRARY_SSH_URL'
\033[38;5;208mLibrary repository url (HTTPS):\033[0m '$LIBRARY_HTTPS_URL'
\033[38;5;208mLibrary GitHub Page:\033[0m '$LIBRARY_GITHUB_PAGE_URL'

\033[38;5;034m====================================
\033[0m"
echo ""

read -p "Is this information correct? (y/N)" -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 0 || return 0
fi

rm -rf .build/ .swiftpm/ DerivedData/

logProcess "Configuring project"

### Update Package.swift
logProcess "Updating $SWIFT_PACKAGE"

logProcess "Running: sed -i \"\" \"s;^let libraryName.*$;let libraryName = \"$LIBRARY_NAME\";g\" $SWIFT_PACKAGE"
sed -i "" "s;^let libraryName.*$;let libraryName = \"$LIBRARY_NAME\";g" $SWIFT_PACKAGE

logProcess "Running: sed -i \"\" \"s;^let libraryVersion.*$;let libraryVersion = \"$LIBRARY_VERSION\";g\" $SWIFT_PACKAGE"
sed -i "" "s;^let libraryVersion.*$;let libraryVersion = \"$LIBRARY_VERSION\";g" $SWIFT_PACKAGE

### Podspec
logProcess "Updating Podspec"

logProcess "Running: sed -i \"\" \"s;^libraryName.*;libraryName = \"$LIBRARY_NAME\";g\" $LIBRARY_TEMPLATE_PODSPEC"
sed -i "" "s;^libraryName.*;libraryName = \"$LIBRARY_NAME\";g" $LIBRARY_TEMPLATE_PODSPEC

logProcess "Running: sed -i \"\" \"s;^libraryVersion.*;libraryVersion = \"$LIBRARY_VERSION\";g\" $LIBRARY_TEMPLATE_PODSPEC"
sed -i "" "s;^libraryVersion.*;libraryVersion = \"$LIBRARY_VERSION\";g" $LIBRARY_TEMPLATE_PODSPEC

logProcess "Running: sed -i \"\" \"s;^gitRemote.*$;gitRemote = \"$LIBRARY_SSH_URL\";g\" $LIBRARY_TEMPLATE_PODSPEC"
sed -i "" "s;^gitRemote.*;gitRemote = \"$LIBRARY_SSH_URL\";g" $LIBRARY_TEMPLATE_PODSPEC

logProcess "Running: sed -i \"\" \"s;^gitHomepage.*;gitHomepage = \"$LIBRARY_GITHUB_URL\";g\" $LIBRARY_TEMPLATE_PODSPEC"
sed -i "" "s;^gitHomepage.*;gitHomepage = \"$LIBRARY_GITHUB_URL\";g" $LIBRARY_TEMPLATE_PODSPEC

### Change podspec name
logProcess "Running: git mv $LIBRARY_TEMPLATE_PODSPEC \"$LIBRARY_NAME.podspec\""
git mv $LIBRARY_TEMPLATE_PODSPEC "$LIBRARY_NAME.podspec"

logProcess "Changing resource bundle helper"
LIBRARY_RESOURCE_BUNDLE="${LIBRARY_NAME}_${LIBRARY_NAME}"

logProcess "Running: sed -i \"\" \"s/@testable import ${LIBRARY_TEMPLATE_NAME}/@testable import ${LIBRARY_NAME}/g\" $LIBRARY_TEMPLATE_TEST_FILE" 
sed -i "" "s/@testable import ${LIBRARY_TEMPLATE_NAME}/@testable import ${LIBRARY_NAME}/g" $LIBRARY_TEMPLATE_TEST_FILE

logProcess "Running: sed -i \"\" \"s/$LIBRARY_TEMPLATE_RESOURCE_BUNDLE/$LIBRARY_RESOURCE_BUNDLE/g\" $RESOURCE_BUNDLE_HELPER"
sed -i "" "s/$LIBRARY_TEMPLATE_RESOURCE_BUNDLE/$LIBRARY_RESOURCE_BUNDLE/g" $RESOURCE_BUNDLE_HELPER

### Change sources directoy name
logProcess "Changing source code directory: Sources/$LIBRARY_TEMPLATE_NAME -> Sources/$LIBRARY_NAME"

logProcess "Running: git mv -f \"Sources/${LIBRARY_TEMPLATE_NAME}\" \"Sources/${LIBRARY_NAME}\""
git mv -f "Sources/${LIBRARY_TEMPLATE_NAME}" "Sources/${LIBRARY_NAME}"

### Change tests directoy name
logProcess "Changing tests directory: Tests/${LIBRARY_TEMPLATE_NAME} -> Tests/$LIBRARY_NAME"

logProcess "Running: git mv -f \"Tests/${LIBRARY_TEMPLATE_NAME}Tests\" \"Tests/${LIBRARY_NAME}Tests\""
git mv -f "Tests/${LIBRARY_TEMPLATE_NAME}Tests" "Tests/${LIBRARY_NAME}Tests"

### Change library name in Vostok file
logProcess "Changing library name in Vostok properties file (projectInfo.vostok)"

logProcess "Running: sed -i \"\" \"s/${LIBRARY_TEMPLATE_NAME}/${LIBRARY_NAME}/g\" $VOSTOK_FILE"
sed -i "" "s/${LIBRARY_TEMPLATE_NAME}/${LIBRARY_NAME}/g" $VOSTOK_FILE

### Install dependencies
logProcess "Installing dependency in development project (DevelopmentApp/)"

logProcess "Running: rm -rf DevelopmentApp/Podfile.lock DevelopmentApp/Pods"
rm -rf DevelopmentApp/Podfile.lock DevelopmentApp/Pods

logProcess "Running: pod install --project-directory=DevelopmentApp --clean-install"
pod install --project-directory=DevelopmentApp --clean-install

### Update README
logProcess "Update README.md file"

logProcess "Running: sed -i \"\" \"s;${LIBRARY_TEMPLATE_GITHUB_PAGE_URL};${LIBRARY_GITHUB_PAGE_URL};g\" README.md"
sed -i "" "s;${LIBRARY_TEMPLATE_GITHUB_PAGE_URL};${LIBRARY_GITHUB_PAGE_URL};g" README.md

logProcess "Running: sed -i \"\" \"s;${LIBRARY_TEMPLATE_HTTPS_URL};${LIBRARY_HTTPS_URL};g\" README.md"
sed -i "" "s;${LIBRARY_TEMPLATE_HTTPS_URL};${LIBRARY_HTTPS_URL};g" README.md

logProcess "Running: sed -i \"\" \"s;${LIBRARY_TEMPLATE_SSH_URL};${LIBRARY_SSH_URL};g\" README.md"
sed -i "" "s;${LIBRARY_TEMPLATE_SSH_URL};${LIBRARY_SSH_URL};g" README.md

logProcess "Running: sed -i \"\" \"s;${LIBRARY_TEMPLATE_GITHUB_URL};${LIBRARY_GITHUB_URL};g\" README.md"
sed -i "" "s;${LIBRARY_TEMPLATE_GITHUB_URL};${LIBRARY_GITHUB_URL};g" README.md

logProcess "Running: sed -i \"\" \"s;${LIBRARY_TEMPLATE_NAME};${LIBRARY_NAME};g\" README.md"
sed -i "" "s;${LIBRARY_TEMPLATE_NAME};${LIBRARY_NAME};g" README.md

logProcess "Running: \"s/(.*\/releases\/tag)\/(.*)\)/\1\/$LIBRARY_VERSION)/g;t\" < README.md > NEW_README.md"
sed -E "s/(.*\/releases\/tag)\/(.*)\)/\1\/$LIBRARY_VERSION)/g;t" < README.md > README.draft

logProcess "Running: sed -E \"s/(.*\/Latests%20release)-(.*)-(blue.*)/\1-$LIBRARY_VERSION-\3/g;t\" < README.draft > README.md"
sed -E "s/(.*\/Latests%20release)-(.*)-(blue.*)/\1-$LIBRARY_VERSION-\3/g;t" < README.draft > README.md

rm -rf README.draft

### Clean docs/index.md
logProcess "Update docs/index.md"

logProcess "Running: sed -i \"\" \"s/$LIBRARY_TEMPLATE_NAME/$LIBRARY_NAME/g\" docs/index.md"
sed -i "" "s/$LIBRARY_TEMPLATE_NAME/$LIBRARY_NAME/g" "docs/index.md"

### Clean CHANGELOG.md
logProcess "Clean CHANGELOG.md"
logProcess "Running: printf \"\" > CHANGELOG.md"
printf "" > CHANGELOG.md

rm -rf .swiftpm .build DerivedData

echo ""
read -p "Would you like to build the library in order to check everything is OK? (y/N)" -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then
    logProcess "Running: swift build"
    swift build

    echo ""

    logProcess "Running: swift test"
    swift test
fi

echo ""
read -p "Would you like to commit these changes? (y/N)" -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then
    git add $SWIFT_PACKAGE
    git add "$LIBRARY_NAME.podspec"
    git add DevelopmentApp
    git add Tests
    git add Sources
    git add --all
	git commit -m "Setup library as $LIBRARY_NAME"
fi

echo ""
logProcess "Everything is ready! Thanks for using our Library Template!"
echo ""