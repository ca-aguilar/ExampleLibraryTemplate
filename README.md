# LibraryTemplate

[![Swift](https://img.shields.io/badge/Swift-5.3_5.4_5.5-yellowgreen?style=flat-square)](https://img.shields.io/badge/Swift-5.3_5.4_5.5-yellowgreen?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)

[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-compatible-orange?style=flat-square)](https://img.shields.io/badge/Cocoapods-compatible-orange?style=flat-square)

[![Build and tests](https://github.com/santander-group-spain/march-mobile-ios_library_template/actions/workflows/spm-ci.yml/badge.svg)](https://github.com/santander-group-spain/march-mobile-ios_library_template/actions/workflows/spm-ci.yml)
[![Create release](https://github.com/santander-group-spain/march-mobile-ios_library_template/actions/workflows/spm-release.yml/badge.svg?branch=main)](https://github.com/santander-group-spain/march-mobile-ios_library_template/actions/workflows/spm-release.yml)

[![Latest release](https://img.shields.io/badge/Latests%20release-1.1.4-blue.svg)](https://github.com/santander-group-spain/march-mobile-ios_library_template/releases/tag/1.1.4)

A full documentation of this library, which includes code coverage and code quality, can be found at this repository's GitHub Page [https://santander-group-spain.github.io/march-mobile-ios_library_template/](https://santander-group-spain.github.io/march-mobile-ios_library_template/).

## Index

0. [(automatic) CHANGELOG](CHANGELOG.md)
1. [Developing with the library template](README_TEMPLATE_LIBRARY.md)
2. [Requirements](#requirements)
3. [Installation](#installation)
    * [Cocoapods](#cocoapods)
    * [Swift Package Manager](#swift-package-manager)

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 10.0+ | 5.3 | [CocoaPods](#cocoapods), [Swift Package Manager](#swift-package-manager) | Fully Tested |
| Linux | Latest Only | [Swift Package Manager](#swift-package-manager) | Unsupported |
| Windows | Latest Only | [Swift Package Manager](#swift-package-manager) | Unsupported |

## Installation

### Cocoapods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate LibraryTemplate into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'LibraryTemplate', '~> <<latest version>>'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding LibraryTemplate as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/santander-group-spain/march-mobile-ios_library_template.git", .upToNextMajor(from: "<<latest version>>"))
]
```
