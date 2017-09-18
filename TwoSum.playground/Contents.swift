//: Playground - noun: a place where people can play
// Two Sum problem: Find the two elements in an array that add up to some defined sum.
import UIKit

// array is already sorted
let numbers = [1,3,6,7,7,12,14]

// Brute Force implementation - O(n^2)

func bruteForceTwoSum(array: [Int], sum: Int) -> Bool {
    for i in 0..<array.count {
        for j in 0..<array.count where j != i {
            if array[i] + array[j] == sum {
                print(array[i],array[j])
                return true
            }
        }
    }
    return false
}

bruteForceTwoSum(array: numbers, sum: 19)


// Binary Search Tree for the complement - O(n log(n))

func binarySearch(array: [Int], key: Int) -> Bool {
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex / 2
    let midValue = array[midIndex]
    
    if key < array[minIndex] || key > array[maxIndex] {
        print("\(key) is not in the array")
        return false
    }
    
    if key > midValue {
        let slice = Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    
    if key < midValue {
        let slice = Array(array[minIndex...midIndex - 1])
        return binarySearch(array: slice, key: key)
    }
    
    if key == midValue {
        print("\(key) found in the array")
        return true
    }
    
    
    return false
}

func binarySearchTwoSum(array: [Int], sum: Int) -> Bool {
    for i in 0..<array.count {
        var tempArray = array
        tempArray.remove(at: i)
        let complement = binarySearch(array: tempArray, key: sum - array[i])
        if complement {
            return true
        }
    }
    return false
}
binarySearchTwoSum(array: numbers, sum: 26)

// pointer manipulation for quickest runtime - Linear [O(n)]
func pointerTwoSum(array: [Int], sum: Int) -> Bool {
    var lowIndex = 0
    var highIndex = array.count - 1
    
    while lowIndex < highIndex {
        if array[lowIndex] + array[highIndex] > sum {
            highIndex -= 1
        }
        if array[lowIndex] + array[highIndex] < sum {
            lowIndex += 1
        }
        if array[lowIndex] + array[highIndex] == sum {
            return true
        }
        
    }
    return false
}

pointerTwoSum(array: numbers, sum: 26)

















