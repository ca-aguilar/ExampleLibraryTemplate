# Developing with this library template

#### Index

0. [Library structure](#library-structure)
    * [Disclaimer](#disclaimer)
    * [GitHooks](#githooks)
    * [GitHub Workflow](#github-workflows)
    * [Scripts](#scripts)
    * [SonarQube](#sonar)
1. [Before start developing with this template](#before-start-developing-with-this-template)
    * Applying changes through setup script(#applying-changes-through-setup-script)
    * Applying changes manually(#applying-changes-manually)
        * [Step 0. Requirements](#step-0-requirements)
        * [Step 1. Vostok file](#step-1-vostok)
        * [Step 2. Version](#step-2-version)
        * [Step 3. Directory structure](#step-3-directory-structure)
        * [Step 4. Resource Bundle](#step-4-resource-bundle)
        * [Step 5. Adding resources to the library ](#step-5-adding-resources-to-the-library)
        * [Step 6. Start Coding!](#step-6-start-coding)
2. [Documenting your project](#project-documentation)
3. [Releasing a new version](#releasing-a-new-version)

## Library structure

### Disclaimer

The following directories and files **should be only modified** by the team responsible for maintaining the library template:

````sh
.githooks
.github
.scripts
.sonar
````

The following directories should not be modified as they are generated and updated in CI/CD tasks

````sh
docs/code
docs/coverage
docs/lint
docs/swiftlint
sonar-reports/*
````

When a new version of the library is published (tagged in Git) a GitHub action automatically modifies the (project's README.md)[README.md] in order to reflect the new version. Please, do not modify the badges in the manifest.

### GitHooks
This library has some predefined hooks that must be executing before commits and push. Those hooks are availabe at **.githoooks**.

In order to add these hooks to your project, run the following command at the root of the project

````sh
git config core.hooksPath .githooks
````

### GitHub Workflows

In **.github/workflows** there are several workflows that run under different conditions.

#### spm-ci.yml

Builds and tests the library.

#### spm-release.yml

Generates a release of this library, and automatically updates (source code) documentation and (lint and coverage) reports.

### Scripts

In **.scripts** there are a few utility scripts that generates the reports locally. Also, this scripts are used by the CI/CD process, except:

 * 00.setup-library.sh

which is used when setting up the library automatically.

### Sonar

In **.sonar** there is a script for converting coverage report from XCOV format to SonarQube.

## Before start developing with this template

As this a template repositories, a few this should be changed before you start coding your own library. Those changes will be exposed here.

### Applying changes through setup script

Run **./.scripts/00.setup-library.sh** and follow the on-screen instructions.

You will only have to enter **Library Name** and **Version**. The script will do the rest and will output the final configuration.

An example of the script execution is shown below:

````sh
n494925@STMAC00N129589P ~/W/S/M/M/t/ESPARQMCH-450_iOS_library_template (feature/add-automatic-changelog)> ./.scripts/00.setup-library.sh 

                                                                   @@
                                                               @@@@@@
                                                            @@@@@@@@
                                                          @@@@@@@@@@
                                                         @@@@@@@@@@
                                                        @@@@@@@@@@
                                                        @@@@@@@@
                                                       @@@@@@
                                                       @@
                                      @@@@@@@@@@@@        @@@@@@@@@@@@@@@
                                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                         @@@@@@@@@          @@@@@@@@@



                               Library template created by MArch Mobile Team
                               =============================================

Setting up GitHooks...
    

Enter the Library name without spaces (i.e.: STCertificatePinning, STUIKit, STSecurityKit).
This will also be the Target and Product name of the Swift library.

STUIKit

Enter the initial version of your Library in SemVer format (x.y.z)

2.3.1

====== Configuration to apply ======
Please verify that the following information is correct

Library name: 'STUIKit'
Library initial version: '2.3.1'
Library repository url (SSH): 'git@github.com:santander-group-spain/march-mobile-ios_library_template.git'
Library repository url (HTTPS): 'https://github.com/santander-group-spain/march-mobile-ios_library_template.git'
Library GitHub Page: 'https://santander-group-spain.github.io/march-mobile-ios_library_template/'

====================================


Is this information correct? (y/N)y
Configuring project
    
Setting library version: 2.3.1
    
Running: printf "2.3.1" > VERSION
    
Changing podspec filename: LibraryTemplate.podspec -> STUIKit.podspec
    
Running: git mv LibraryTemplate.podspec "STUIKit.podspec"
    
Running: sed -i "" "s/'LibraryTemplate'/'STUIKit'/g" Examples/Podfile
    
Changing resource bundle helper
    
Running: sed -i "" "s/@testable import LibraryTemplate/@testable import STUIKit/g" Tests/LibraryTemplateTests/LibraryTests.swift
    
Running: sed -i "" "s/LibraryTemplate_LibraryTemplate/STUIKit_STUIKit/g" Sources/LibraryTemplate/ResourceHelper.swift
    
Changing source code directory: Sources/LibraryTemplate -> Sources/STUIKit
    
Running: git mv "Sources/LibraryTemplate" "Sources/STUIKit"
    
Changing tests directory: Tests/LibraryTemplate -> Tests/STUIKit
    
Running: git mv "Tests/LibraryTemplateTests" "Tests/STUIKitTests"
    
Changing library name in Vostok properties file (projectInfo.vostok)
    
Running: sed -i "" "s/LibraryTemplate/STUIKit/g" projectInfo.vostok
    
Installing dependency in development project (DevelopmentApp/)
    
Running: rm -rf DevelopmentApp/Podfile.lock DevelopmentApp/Pods
    
Running: pod install --project-directory=DevelopmentApp --clean-install
    
Ignoring unf_ext-0.0.7.7 because its extensions are not built. Try: gem pristine unf_ext --version 0.0.7.7
Analyzing dependencies
Downloading dependencies
Installing STUIKit (2.3.1)
Generating Pods project
Integrating client project
Pod installation complete! There is 1 dependency from the Podfile and 1 total pod installed.

Would you like to build the library in order to check everything is OK? (y/N)y
Running: swift build
    
[5/5] Build complete!

Running: swift test
    
[3/3] Build complete!
Test Suite 'All tests' started at 2022-03-08 10:17:48.621
Test Suite 'STUIKitPackageTests.xctest' started at 2022-03-08 10:17:48.623
Test Suite 'LibraryTests' started at 2022-03-08 10:17:48.623
Test Case '-[STUIKitTests.LibraryTests testCanReadEmbeddedResource]' started.
Test Case '-[STUIKitTests.LibraryTests testCanReadEmbeddedResource]' passed (0.004 seconds).
Test Case '-[STUIKitTests.LibraryTests testCanReadEmbeddedResourceInSubdirectory]' started.
Test Case '-[STUIKitTests.LibraryTests testCanReadEmbeddedResourceInSubdirectory]' passed (0.001 seconds).
Test Suite 'LibraryTests' passed at 2022-03-08 10:17:48.629.
         Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds
Test Suite 'STUIKitPackageTests.xctest' passed at 2022-03-08 10:17:48.629.
         Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds
Test Suite 'All tests' passed at 2022-03-08 10:17:48.629.
         Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

Would you like to commit these changes? (y/N)y
SwiftLint Start...
SwiftLint Finished.

[feature/add-automatic-changelog 0b0bbc5] Setup library as STUIKit
 21 files changed, 954 insertions(+), 934 deletions(-)
 delete mode 100644 Examples/Pods/Local Podspecs/LibraryTemplate.podspec.json
 rename LibraryTemplate.podspec => STUIKit.podspec (100%)
 rename Sources/{LibraryTemplate => STUIKit}/ResourceHelper.swift (97%)
 rename Sources/{LibraryTemplate => STUIKit}/Resources/README.md (100%)
 rename Sources/{LibraryTemplate => STUIKit}/Resources/subdirectory/empty.json (100%)
 rename Tests/{LibraryTemplateTests => STUIKitTests}/LibraryTests.swift (98%)

Everything is ready! Thanks for using our Library Template!
    

n494925@STMAC00N129589P ~/W/S/M/M/t/ESPARQMCH-450_iOS_library_template (feature/add-automatic-changelog)>
````

### Applying changes manually

**NOT RECOMMENDED** Use the setup Script.

#### Step 0. Requirements

Certain tools are required in order to run a linter, o generate documentation from code. Install the following dependencies in your development environment. Please, no do not commit **swiftlint** binaries, or even Cocoapods. Let´s keep our repositories cleaner! Thanks!

```sh
brew install swiftlint
[sudo] gem install jazzy
```

#### Step 1. Vostok

Replace in [projectInfo.vostok](projectInfo.vostok) the **libraryName** with your library's name. For exmaple, if the library name is be **STUIKit**.

```swift
{
  "technology": "iOS-LIBRARY",
  "ios": {
    "libraryName": "STUIKit"
  }  
}
```

Additional configuration related to Vostok and SonarQube can be added here.

#### Step 2. Version

In [VERSION](VERSION) file set the starting version of your library, without any new line or blank.

#### Step 3. Directory Structure

* Rename **Sources/LibraryTemplate** to **Sources/\<Library Name\>**
* Rename **Tests/LibraryTemplateTests** to **Tests/\<Library Name\>Tests**

#### Step 4. Resource Bundle

As this library supports SPM and Cocoapods a few things should be taken into account. Both, SPM and Cocoapods, handle embedded resources (a.k.a. Bundle) differently. In order to support both in an undistinguished way, we have created the class **ResourceHelper.swift** which class member **module** allows access to the bundle path like:

```swift
guard let exampleURL = ResourceHelper.module.url(forResource: "example", withExtension: "txt") else {
```

1. This requires that, when changing your library name in Package.swift, you make also a change in line 15 of **ResourceHelper.swift**

```swift
private static let bundleName = "LibraryTemplate_LibraryTemplate" // Format is <library name>_<target name>
```

For example, if the library's name is **STUIKit**, and the target that holds the resources is also **STUIKit**, the **spmBundleName** variable will be:

```swift
private static let bundleName = "STUIKit_STUIKit" // Format is <library name>_<target name>
```

2. Also, for keeping compatibility with Cocoapods, change the bundle name in the podspec's **resource_bundles**.

Unit tests are present in the library project alongside a test app, where both of them check that a embedded file can be read either with a project using SPM or Cocoapods.

#### Step 5. Adding resources to the library

If you need to embedded resources into this library, please put your assets into **Sources/Resources**. They will be automatically added to your project in a Bundle file.

#### Step 6. Start coding!

Project library can be open in two ways, both compatible. 

1. From SPM

```sh
open Package.swift
```

Here you can code and run tests, as in any SPM library.

2. From the Example Workspace

As this project also has Cocoapods, there is an example App that uses it, and can be used for development.

```sh
open DevelopmentApp/DevApp.xcworkspace
```

## Project documentation

As stated before, some documentation is automatically generated in GitHub Workflow and published in GitHub Pages. That's been said, the [project's readme](README.md) should be your starting point for documentation. 

Also, you can create other directories and files in **/docs**, and even modify **/docs/index.md**. 

Source code documentation is done using (Realm's Jazzy)[https://github.com/realm/jazzy] and (Realm's Swiftlint)[https://github.com/realm/swiftlint].

## Releasing a new version

Releasing a new version of your library is done throught a GitLab Workflow.

When you have a new version to publish create a new **release** branch and modify the **VERSION** file as needed. **DO NOT** add a new line at the end of the file.

Then commit and push this change to GitHub and create a PR to **main** branch. 

The changelog is automatically updated with the PR description, a (git) tag is created (for both, SPM and Cocoapods), and the new release will be published.
