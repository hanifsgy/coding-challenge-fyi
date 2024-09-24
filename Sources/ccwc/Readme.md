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

- improved challenge 1: leveraging swift argument parser. Refer: https://github.com/apple/swift-argument-parser

- challenge 2: get the number of lines in a file

```swift
swift run ccwc -l test.txt
```
output should be 
```md
7145 test.txt
```

- challenge 3: get the number of words in a file

```swift
swift run ccwc -w test.txt  
```
output should be 
```md
58164 test.txt
```

- challenge 4: get the number of characters in a file.

```swift
swift run ccwc -m test.txt
```
output should be 
```md
339292 test.txt
```

WIP locale issue

- challenge 5: get the number of bytes, lines, words, and characters in a file.

```swift
swift run ccwc test.txt
```
output should be 
```md
342190 7145 58164 339292 test.txt
```