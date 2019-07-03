//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Macbook on 6/27/19.
//  Copyright © 2019 vudoan.iosdev.com. All rights reserved.
//

import Foundation

// The recursive version of binary search.
public func binarySearch<T: Comparable>(_ input: [T], searchKey: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if input[midIndex] > searchKey {
            return binarySearch(input, searchKey: searchKey, range: range.lowerBound..<midIndex)
        } else if input[midIndex] < searchKey {
            return binarySearch(input, searchKey: searchKey, range: midIndex + 1..<range.upperBound)
        } else {
            return midIndex
        }
    }
}

/*
 The iterative version of binary search.
 
 Notice how similar these functions are. The difference is that this one
 uses a while loop, while the other calls itself recursively.
 */
public func binarySearch<T: Comparable>(_ input: [T], searchKey: T) -> Int? {
    var lowerBound = 0
    var upperBound = input.count
    
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if input[midIndex] == searchKey {
            return midIndex
        } else if input[midIndex] > searchKey {
            upperBound = midIndex
        } else {
            lowerBound = midIndex + 1
        }
    }
    
    return nil
}
