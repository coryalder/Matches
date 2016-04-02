//
//  Regexes.swift
//  ndx
//
//  Created by Cory Alder on 2016-03-24.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

import XCTest
@testable import Matches

class BaseTests: XCTestCase {
    func testFirstMatching() {
        let match1 = "string1\nstring2".firstMatching("(.*)")
        // => "string1"
        XCTAssertNotNil(match1, "no results")
        XCTAssertEqual(match1!, "string1", "Incorrect matching")
    }
    
    func testEveryMatch() {
        let matches = "string1\nstring2\nstirng32".everyMatch("(.*[0-9]$)")
        // => [["string1"], ["string2"]]
        XCTAssertNotNil(matches, "no results")
        XCTAssertEqual(matches!, [["string1"], ["string2"], ["stirng32"]], "Incorrect matching")
    }
}