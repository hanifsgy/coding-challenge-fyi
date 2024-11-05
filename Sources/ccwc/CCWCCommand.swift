import Foundation
import ArgumentParser

private struct RuntimeError: Error, CustomStringConvertible {
    let description: String
    
    init(_ description: String) {
        self.description = description
    }
}

struct CCWCCommand: ParsableCommand {

    /// Challenge 1: Print the byte count
    @Flag(name: .shortAndLong, help: "Print the byte count")
    var byteCount: Bool = false 

    /// Challenge 2: Print the line count
    @Flag(name: .shortAndLong, help: "Print the line count")
    var lineCount: Bool = false

    /// Challenge 3: Print the word count
    @Flag(name: .shortAndLong, help: "Print the word count")
    var wordCount: Bool = false

    /// Challenge 4: Print the character count
    /// - still need to reconsider locale 
    @Flag(name: .shortAndLong, help: "Print the character count")
    var characterCount: Bool = false

    /// Challenge 5: Print the byte count, line count, word count, and character count
    // Default option: if no flags are provided, count bytes, lines, and words
    var defaultCount: Bool {
        return !byteCount && !lineCount && !wordCount && !characterCount
    }
    
    @Argument(help: "The file to read", completion: .file())
    var file: String?

    public init() { }

    public func run() throws {
        let input: String
        
        if let filePath = file {
            guard fileExists(at: filePath) else {
                throw RuntimeError("File does not exist at path: \(filePath)")
                return
            }
            input = try String(contentsOfFile: filePath, encoding: .utf8)
        } else {
            // Read from standard input
            let standardInput = FileHandle.standardInput
            input = String(decoding: try standardInput.readToEnd() ?? Data(), as: UTF8.self)
        }

        if byteCount {
            let byteCount = input.utf8.count
            print("\(byteCount)")
        }

        if lineCount {
            let lineCount = input.components(separatedBy: .newlines).count - 1
            print("\(lineCount)")
        }

        if wordCount {
            let wordCount = input.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }.count
            print("\(wordCount)")
        }

        if characterCount {
            let characterCount = input.count
            print("\(characterCount)")
        }

        if defaultCount {
            let byteCount = input.utf8.count
            let lineCount = input.components(separatedBy: .newlines).count - 1
            let wordCount = input.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }.count
            print("\(byteCount) \(lineCount) \(wordCount)")
        }
    }

    func fileExists(at path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
    
    func readFileAndCountBytes(at path: String) throws -> Int {
        let fileData = try Data(contentsOf: URL(fileURLWithPath: path))
        return fileData.count
    }

    /// Challenge 2: Print the line count
    /// - Parameter path: The path to the file
    /// - Returns: The number of lines in the file 
    func readFileAndCountLines(at path: String) throws -> Int {
        let fileContent = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
        let lines = fileContent.components(separatedBy: "\n")
        return lines.count - 1
    }

    /// Challenge 3: Print the word count
    /// - Parameter path: The path to the file
    /// - Returns: The number of words in the file  
    func readFileAndCountWords(at path: String) throws -> Int {
        let fileContent = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
        let words = fileContent.components(separatedBy: .whitespacesAndNewlines)
        return words.filter { !$0.isEmpty }.count
    }

    /// Challenge 4: Print the character count
    /// - Parameter path: The path to the file
    /// - Returns: The number of characters in the file
    func readFileAndCountCharacters(at path: String) throws -> Int {
        let fileContent = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
        return fileContent.count
    }
}
