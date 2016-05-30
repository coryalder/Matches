//
//  Regexes.swift
//  ndx
//
//  Created by Cory Alder on 2016-03-24.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

import Foundation


extension NSTextCheckingResult: Sequence {
    public func makeIterator() -> AnyIterator<NSRange> {
        // keep the index of the next car in the iteration
        var nextIndex = 1
        
        // Construct a GeneratorOf<Car> instance,
        // passing a closure that returns the next
        // car in the iteration
        return AnyIterator<NSRange> {
            if nextIndex > self.numberOfRanges-1 {
                return nil
            }
            let current = self.range(at: nextIndex)
            nextIndex += 1
            return current
        }
    }
}

extension String {
    
    public func everyMatch(pattern: String, options: NSRegularExpressionOptions = [.anchorsMatchLines]) -> [[String]]? {
        
        let regex = try? NSRegularExpression(pattern: pattern, options: options)
        
        let maybeResults = regex?.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
        
        guard let results = maybeResults else {
            return nil
        }
        
        var allOutputs = [[String]]()
        
        for res in results where res.numberOfRanges > 0 {
            
            var row = [String]()
            
            for match in res where match.location != NSNotFound {
                row.append((self as NSString).substring(with: match))
            }
            
            let filteredRow = row.filter { $0.characters.count > 0 }
            
            if filteredRow.count > 0 {
                allOutputs.append(filteredRow)
            }
        }
        
        return allOutputs
        
        
    }
    
    public func firstMatching(pattern: String, options: NSRegularExpressionOptions = [.anchorsMatchLines]) -> String? {
        let regex = try? NSRegularExpression(pattern: pattern, options: options)
        let result = regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count))
        
        guard result?.numberOfRanges > 1,
            let firstRange = result?.range(at: 1) where firstRange.location != NSNotFound else {
                return nil
        }
        
        return (self as NSString).substring(with: firstRange)
    }
}

