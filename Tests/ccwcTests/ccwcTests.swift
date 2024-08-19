import XCTest
@testable import ccwc

class ccwcTests: XCTestCase {
    
    func testParseArguments() {
        // Test with no arguments
        CommandLine.arguments = ["ccwc"]
        XCTAssertNil(parseArguments())
        
        // Test with one argument
        CommandLine.arguments = ["ccwc", "testfile.txt"]
        XCTAssertEqual(parseArguments(), "testfile.txt")
    }
    
    func testFileExists() {
        // Create a temporary file
        let tempFilePath = "/tmp/testfile.txt"
        FileManager.default.createFile(atPath: tempFilePath, contents: nil, attributes: nil)
        
        // Test file existence
        XCTAssertTrue(fileExists(at: tempFilePath))
        
        // Remove the temporary file
        try? FileManager.default.removeItem(atPath: tempFilePath)
        
        // Test file non-existence
        XCTAssertFalse(fileExists(at: tempFilePath))
    }
    
    func testReadFileAndCountBytes() {
        // Create a temporary file with known content
        let tempFilePath = "/tmp/testfile.txt"
        let content = "Hello, world!"
        try? content.write(toFile: tempFilePath, atomically: true, encoding: .utf8)
        
        // Test byte count
        do {
            let byteCount = try readFileAndCountBytes(at: tempFilePath)
            XCTAssertEqual(byteCount, content.lengthOfBytes(using: .utf8))
        } catch {
            XCTFail("Error reading file: \(error)")
        }
        
        // Clean up
        try? FileManager.default.removeItem(atPath: tempFilePath)
    }
}
