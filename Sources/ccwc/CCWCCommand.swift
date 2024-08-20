import Foundation
import ArgumentParser

struct CCWCCommand: ParsableCommand {

    @Flag(name: .shortAndLong, help: "Print the byte count")
    var byteCount: Bool = false 

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
        } else {
            print("File processed without byte count")
        }
    }

    func fileExists(at path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
    
    func readFileAndCountBytes(at path: String) throws -> Int {
        let fileData = try Data(contentsOf: URL(fileURLWithPath: path))
        return fileData.count
    }
}
