# Building WC
- wc -- word, line, character, and byte count

# Program 
- compile the program 

```swift 
swiftc -o ccwc Sources/ccwc/main.swift
./ccwc
```

- challenge 1, get the number of bytes in a file. Byte is a unit of digital information that consists of eight bits. In the context of a file, the number of bytes represent the file size, i.e the total of data stored in the file.

```swift
swift run ccwc -c test.txt
```
the output should be 
```md
342190 test.txt
```

- improved challenge 1: leveraging swift argument parser