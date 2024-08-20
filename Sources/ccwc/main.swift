import Foundation

func main() {
    // guard let filePath = parseArguments() else {
    //     print("Usage: ccwc <file>")
    //     return
    // }
    
    // guard fileExists(at: filePath) else {
    //     print("File does not exist")
    //     return
    // }
    
    // do {
    //     let byteCount = try readFileAndCountBytes(at: filePath)
    //     print("\(byteCount) bytes")
    // } catch {
    //     print("Error reading file: \(error)")
    // }

    // Execute the command with swift argument parser
    CCWCCommand.main()
}

func parseArguments() -> String? {
    guard CommandLine.arguments.count > 1 else {
        return nil
    }
    return CommandLine.arguments[1]
}

func fileExists(at path: String) -> Bool {
    return FileManager.default.fileExists(atPath: path)
}

func readFileAndCountBytes(at path: String) throws -> Int {
    let fileData = try Data(contentsOf: URL(fileURLWithPath: path))
    return fileData.count
}

main()
