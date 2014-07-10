// Playground - noun: a place where people can play

import Cocoa

//Takes two ints and returns decimal result as string with repeated value 
//displayed inside parenthesis.
//ex: 10/3 == 3.(3)
func divideify(numberA:Int, dividedBy numberB:Int) -> String {
    var wholeNumber:Int = numberA/numberB
    var remainder = numberA%numberB
    var result:String = "\(wholeNumber)"
    if remainder != 0 {
        result += "."
    }
    var lastRemainder:Int = remainder
    
    while remainder > 0 {
        let newWhole = remainder * 10
        wholeNumber = newWhole/numberB
        remainder = newWhole%numberB
        if lastRemainder == remainder {
            result += "(\(wholeNumber))"
            break
        }
        result += String(wholeNumber)
    }
    return result
}


let result:String = divideify(5615, dividedBy: 7)
let result1:String = divideify(10, dividedBy: 3)