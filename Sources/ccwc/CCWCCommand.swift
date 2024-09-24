import Foundation
import ArgumentParser

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

    // No need for a standard input flag; we will read from standard input directly if no file is provided.

    @Argument(help: "The file to read")
    var file: String

    public init() { }

    public func run() throws {
        let input: String
        
        if file.isEmpty {
            input = String(decoding: FileHandle.standardInput.readDataToEndOfFile(), as: UTF8.self)
        } else {
            guard fileExists(at: file) else {
                print("File does not exist")
                return
            }
            input = try String(contentsOfFile: file, encoding: .utf8)
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
