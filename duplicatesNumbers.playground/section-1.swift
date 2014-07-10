// Playground - noun: a place where people can play

import Cocoa

func findIntersection(numbers1:[Int], numbers2:[Int]) -> [Int] {
    var numberDictionary:Dictionary<Int, Int> = Dictionary()
    var numberIntersections:Dictionary<Int, Int> = Dictionary()
    var intersections:[Int] = [Int]()
    
    for number in numbers1 {
        let existingNumber:Int? = numberDictionary[number]
        if !existingNumber {
            numberDictionary[number] = number
        }
    }
    
    for number in numbers2 {
        let existingNumber:Int? = numberDictionary[number]
        let intersectingNumber:Int? = numberIntersections[number]
        if existingNumber &&  !intersectingNumber {
            intersections += number
            numberIntersections[number] = number
        }
    }
    return intersections
}


func unionNoDups(numbers1:[Int], numbers2:[Int]) -> Int[] {
    var numberDictionary:Dictionary<Int, Int> = [:]
    var unioned:[Int] = [Int]()
    
    for number in numbers1 {
        let existingNumber:Int? = numberDictionary[number]
        if !existingNumber {
            numberDictionary[number] = number
            unioned += number
        }
    }
    
    for number in numbers2 {
        let existingNumber:Int? = numberDictionary[number]
        if !existingNumber {
            numberDictionary[number] = numberß
            unioned += number
        }
    }
    
    return unioned
}

let array1:[Int] = [1,2,3,4,5,6,7,8,9,10,0,4,2,4]
let array2:[Int] = [2,2,4,5,1,0,100,10,30,28,98,11]

findIntersection(array1, array2)
unionNoDups(array1, array2)

