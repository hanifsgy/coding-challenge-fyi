import Testing
import Foundation
@testable import ccwc

@Suite("ccwcTests")
struct ccwcTests {
    @Test func testParseArguments() async throws {
        let args = ["ccwc"]
        let result = parseArguments(args)
        assert(result == nil)
    }

    @Test func testParseArgumentsWithOneArgument() async throws {
        let args = ["ccwc", "testfile.txt"]
        let result = parseArguments(args)
        assert(result == "testfile.txt")
    }

    @Test func testFileExists() async throws {
        let tempFilePath = "/tmp/testfile.txt"
        FileManager.default.createFile(atPath: tempFilePath, contents: nil, attributes: nil)
        let result = fileExists(at: tempFilePath)
        assert(result == true)
        try FileManager.default.removeItem(atPath: tempFilePath)
        let result2 = fileExists(at: tempFilePath)
        assert(result2 == false)
    }

    @Test func testReadFileAndCountBytes() async throws {
        let tempFilePath = "/tmp/testfile.txt"
        let content = "Hello, world!"
        try content.write(toFile: tempFilePath, atomically: true, encoding: .utf8)
        let result = try readFileAndCountBytes(at: tempFilePath)
        assert(result == content.lengthOfBytes(using: .utf8))
    }

    @Test func testReadFileAndCountLines() async throws {
        let tempFilePath = "/tmp/testfile.txt"
        let content = "Hello, world!\nThis is a test.\n"
        try content.write(toFile: tempFilePath, atomically: true, encoding: .utf8)
        let lineCount = try readFileAndCountLines(at: tempFilePath)
        assert(lineCount == 2)
    }
}

// class ccwcTests: XCTestCase {
    
//     func testParseArguments() {
//         // Test with no arguments
//         CommandLine.arguments = ["ccwc"]
//         XCTAssertNil(parseArguments())
        
//         // Test with one argument
//         CommandLine.arguments = ["ccwc", "testfile.txt"]
//         XCTAssertEqual(parseArguments(), "testfile.txt")
//     }
    
//     func testFileExists() {
//         // Create a temporary file
//         let tempFilePath = "/tmp/testfile.txt"
//         FileManager.default.createFile(atPath: tempFilePath, contents: nil, attributes: nil)
        
//         // Test file existence
//         XCTAssertTrue(fileExists(at: tempFilePath))
        
//         // Remove the temporary file
//         try? FileManager.default.removeItem(atPath: tempFilePath)
        
//         // Test file non-existence
//         XCTAssertFalse(fileExists(at: tempFilePath))
//     }
    
//     func testReadFileAndCountBytes() {
//         // Create a temporary file with known content
//         let tempFilePath = "/tmp/testfile.txt"
//         let content = "Hello, world!"
//         try? content.write(toFile: tempFilePath, atomically: true, encoding: .utf8)
        
//         // Test byte count
//         do {
//             let byteCount = try readFileAndCountBytes(at: tempFilePath)
//             XCTAssertEqual(byteCount, content.lengthOfBytes(using: .utf8))
//         } catch {
//             XCTFail("Error reading file: \(error)")
//         }
        
//         // Clean up
//         try? FileManager.default.removeItem(atPath: tempFilePath)
//     }
// }
