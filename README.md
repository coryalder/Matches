# Matches

Easy regular expressions in Swift

## Features

### Find the first match

    import Matches
    
    let match1 = "string1\nstring2".firstMatching("(^s)")
    // => "string1"
    
### Find all matches

    import Matches
    
    let matches = "string1\nstring2".everyMatch("(^s.*)")
    // => [["string1"], ["string2"]]
    
Because your pattern may have multiple capture groups, this returns an array of arrays of strings. Each item in the array is a capture group.

### Iterate `NSTextCheckingResult`s

    import Matches
    
    let pattern = "(.*)"
    let string = "a string\nwith\nmutliple\nlines"
    
    let regex = try? NSRegularExpression(pattern: pattern, options: [])
    let maybeResults = regex?.matchesInString(string, options: [], range: NSMakeRange(0, string.characters.count))
    if let results = maybeResults {
    	for result in results {
    		print("result is \(result)")
    	}
    }
    

## Installation

### Swift Package Manager

Add Later to your `Package.swift` file:

    import PackageDescription

    let package = Package(
        name: "YourPackageName",
        dependencies: [
            .Package(url: "https://github.com/coryalder/Matches.git", majorVersion: 0),
        ]
    )











