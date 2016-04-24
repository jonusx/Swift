// Playground - noun: a place where people can play

import Cocoa

func findIntersection<T where T:Comparable, T:Hashable>(left:[T], _ right:[T]) -> [T] {
    var elementDict:[T:T] = [:]
    var elementIntersections:[T:T] = [:]
    var intersections:[T] = []
    
    for number in left where elementDict[number] == nil {
        elementDict[number] = number
    }
    
    for number in right where elementDict[number] != nil && elementIntersections[number] == nil{
        intersections += [number]
        elementIntersections[number] = number
    }
    return intersections
}


func unionNoDups<T where T:Comparable, T:Hashable>(left:[T], _ right:[T]) -> [T] {
    var elementDict:[T:T] = [:]
    var unioned:[T] = []
    
    for element in left where elementDict[element] == nil {
        elementDict[element] = element
        unioned += [element]
    }
    
    for element in right where elementDict[element] == nil {
        elementDict[element] = element
        unioned += [element]
    }
    return unioned
}

let array1:[Int] = [1,2,3,4,5,6,7,8,9,10,0,4,2,4]
let array2:[Int] = [2,2,4,5,1,0,100,10,30,28,98,11]

findIntersection(array1, array2)
unionNoDups(array1, array2)

