import Foundation

func main(_ args: [String] = CommandLine.arguments) {
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

func parseArguments(_ args: [String] = CommandLine.arguments) -> String? {
    guard args.count > 1 else {
        return nil
    }
    return args[1]
}

func fileExists(at path: String) -> Bool {
    return FileManager.default.fileExists(atPath: path)
}

func readFileAndCountBytes(at path: String) throws -> Int {
    let fileData = try Data(contentsOf: URL(fileURLWithPath: path))
    return fileData.count
}

func readFileAndCountLines(at path: String) throws -> Int {
    let fileContent = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
    let lines = fileContent.components(separatedBy: "\n")
    return lines.count - 1
}

main()
