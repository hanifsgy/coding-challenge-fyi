import Foundation

func main(_ args: [String] = CommandLine.arguments) {
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

func readFileAndCountWords(at path: String) throws -> Int {
    let fileContent = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
    let words = fileContent.components(separatedBy: .whitespacesAndNewlines)
    return words.filter { !$0.isEmpty }.count
}

main()
