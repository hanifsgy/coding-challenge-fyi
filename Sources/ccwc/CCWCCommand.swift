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

    @Argument(help: "The file to read")
    var file: String

    public init() { }

    public func run() throws {
        guard fileExists(at: file) else {
            print("File does not exist")
            return
        }
        
        if byteCount {
            let byteCount = try readFileAndCountBytes(at: file)
            print("\(byteCount) bytes")
        }

        if lineCount {
            do {
                let lineCount = try readFileAndCountLines(at: file)
                print("\(lineCount) \(file)")
            } catch {
                print("Error reading file: \(error)")
            }
        }

        if wordCount {
            do {
                let wordCount = try readFileAndCountWords(at: file)
                print("\(wordCount) \(file)")
            } catch {
                print("Error reading file: \(error)")
            }
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
}
