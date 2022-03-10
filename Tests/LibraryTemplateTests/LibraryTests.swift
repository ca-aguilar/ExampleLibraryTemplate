import XCTest
@testable import LibraryTemplate

final class LibraryTests: XCTestCase {

    func testCanReadEmbeddedResource() {
        let exampleURL = ResourceHelper.module.url(forResource: "README", withExtension: "md")
        XCTAssertNotNil(exampleURL, "Could not load URL from embedded resource.")
        XCTAssertTrue(exampleURL?.isFileURL ?? false, "Embedded resource is not a file.")
        do {
            let exampleData = try Data(contentsOf: exampleURL!)
            XCTAssertNotNil(exampleData, "Embedded resource is has no content.")
            XCTAssertTrue(exampleData.count > 0, "Embedded resource is empty")
            let testStr = "#Library\n"
            let exampleStr = String(data: exampleData, encoding: .utf8) ?? ""
            XCTAssertTrue(exampleStr == testStr, "Embedded resources don't match. '\(testStr)' vs '\(exampleStr)'")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCanReadEmbeddedResourceInSubdirectory() {
        let exampleURL = ResourceHelper.module.url(forResource: "empty", withExtension: "json")
        XCTAssertNotNil(exampleURL, "Could not load URL from embedded resource.")
        XCTAssertTrue(exampleURL?.isFileURL ?? false, "Embedded resource is not a file.")
        do {
            let exampleData = try Data(contentsOf: exampleURL!)
            XCTAssertNotNil(exampleData, "Embedded resource is has no content.")
            XCTAssertTrue(exampleData.count > 0, "Embedded resource is empty")
            let testStr = "{}\n"
            let exampleStr = String(data: exampleData, encoding: .utf8) ?? ""
            XCTAssertTrue(exampleStr == testStr, "Embedded resources don't match. '\(testStr)' vs '\(exampleStr)'")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
