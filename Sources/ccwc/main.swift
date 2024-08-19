import Foundation

func main() {
    guard CommandLine.arguments.count > 1 else {
        print("Usage: ccwc <file>")
        return 
    }
    /// filePath is the first argument after the program name   
    let filePath = CommandLine.arguments[1]
    /// check if the file exists
    guard FileManager.default.fileExists(atPath: filePath) else {
        print("File does not exist")
        return 
    }
    /// Read the file 
    do {
        let fileData = try Data(contentsOf: URL(fileURLWithPath: filePath))
        let byteCount = fileData.count
        print("\(byteCount) bytes")
    } catch {
        print("Error reading file: \(error)")
        return 
    }

}   


main()