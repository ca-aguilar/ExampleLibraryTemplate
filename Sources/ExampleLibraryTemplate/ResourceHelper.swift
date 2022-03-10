//
//  File.swift
//  
//
//  Created by Ezequiel (Kimi) Aceto on 9/2/22.
//

import Foundation

/** **ResourceHelper** provides access to bundled resources no matter if the library
was included in a project using SPM or Cocoapods.

Put library resources inside **Sources/\<Library Name\>/Resources**. Remember that that directory structure is
flattened when the bundle is generated. So filenames should be unique eventhought they are in different directories.
*/
public class ResourceHelper {

    private init() {}

    // Format is <library name>_<target name> where <library name> and <target name> should be equal
    private static let bundleName = "ExampleLibraryTemplate_ExampleLibraryTemplate"

    /**
    Gives access to library's resource bundle.

    As SPM generates a Bundle.module attr, which is not available using Cocoapods,
    this approach should be taken in order to make sure that the Bundle and
    its content can be accessed no matter how a developer integrates this library.

    Usage:
    ````swift
    let url = ResourceHelper.module.url(forResource: "filename", withExtension: "ext")
    ````

    - note: If SPM is used from CLI, ResourceHelper.module returns (SPM's) Bundle.module
    - warning: Access to **module** throws a fatal error if the bundle does not exist. This error happens if there is a error building the library's bundle.
    */
    public static let module: Bundle = {
        // If library is being compiled using SPM, use auto-generated Bundle.module
        #if SWIFT_PACKAGE
        return Bundle.module
        #else        
        for candidate in bundleCandidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            // swiftlint:disable init_usage
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle for library.")        
        #endif
    }()
    
    /**
        A list of possible places where the bundle resource may be found during app runtime.
        Compatible with SPM and Cocoapods.
    */
    private static let bundleCandidates =  [
        // Bundle should be present here when the package is linked into an App.
        Bundle.main.resourceURL,

        // Bundle should be present here when the package is linked into a framework.
        Bundle(for: ResourceHelper.self).resourceURL,

        // For command-line tools.
        Bundle.main.bundleURL
    ]
}
