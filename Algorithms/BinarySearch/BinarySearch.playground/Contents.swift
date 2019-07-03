import PlaygroundSupport
import AlgorithmsTest

let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]
let sorted = numbers.sorted()

// work
binarySearch(sorted, searchKey: 2, range: 0 ..< sorted.count)   // gives 0

binarySearch(sorted, searchKey: 31)
