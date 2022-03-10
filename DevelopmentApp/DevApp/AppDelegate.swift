//
//  AppDelegate.swift
//  DevelopmentApp
//
//  Created by Ezequiel (Kimi) Aceto on 9/2/22.
//

import UIKit
import LibraryTemplate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()

        // Test that example app can access resource inside library's bundle
        checkEmbeddedTestResource()
        return true
    }
}

extension AppDelegate {
    private func checkEmbeddedTestResource() {
        guard let exampleURL = LibraryTemplate
                .ResourceHelper
                .module
                .url(forResource: "README", withExtension: "md") else {
            fatalError("Cannot get url of embedded resource.")
        }
        guard let exampleData = try? Data(contentsOf: exampleURL),
              let exampleStr = String(data: exampleData, encoding: .utf8) else {
            fatalError("Cannot read embedded resource.")
        }
        if exampleStr != "#Library\n" {
            fatalError("Embedded resource mismatched.")
        }
    }
}
