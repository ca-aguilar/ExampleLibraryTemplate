// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

// MARCH TEAM SPACE
/// DO NOT REMOVE THESE LINES
let libraryVersion = "1.1.4"
let libraryName = "LibraryTemplate"
/// END DO NOT REMOVE THESE LINES
// END MARCH TEAM SPACE


let package = Package(
    name: libraryName,
    platforms: [
        .iOS(.v10)
        // add tvOS, macOS, watchOS, linux if needed. iOS is mandatory.
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: libraryName,
            targets: [libraryName]
        )
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: libraryName,
            dependencies: [],
            resources: [
                .process("Resources/")
            ],
            cSettings: [
                .define("\(libraryName)_VERSION".uppercased(), to: libraryVersion), // DO NOT REMOVE THIS DEFINITION
            ]
        ),
        .testTarget(
            name: "\(libraryName)Tests",
            dependencies: [
                Target.Dependency.target(name: libraryName)
            ]
        )
    ],
    swiftLanguageVersions: [.v5], // Swift 5 **is a must**.
    cLanguageStandard: .c99,
    cxxLanguageStandard: CXXLanguageStandard.gnucxx14
)