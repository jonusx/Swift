// Playground - noun: a place where people can play

import UIKit

func binaryStringToFloat(string:String) -> Float {
    var result:Float = 0.0
    
    var index:Float = 0
    var decimalFound:Bool = false
    var characteristicArray:[Character] = []
    
    for character in string {
        if character == "." {
            decimalFound = true
            index = 0
            characteristicArray = characteristicArray.reverse()
            for characteristic in characteristicArray {
                let number:Float = Float("\(characteristic)".toInt()!)
                result += number * pow(2, index)
                index++
            }
            index = 1
            characteristicArray.removeAll(keepCapacity: false)
            continue
        }
        
        if !decimalFound {
            characteristicArray += character
        }
        else
        {
            let number:Float = Float("\(character)".toInt()!)
            result += number * pow(2, -index)
        }

        index++;
    }
    return result
}

func floatToBinaryString(number:Float) -> String {
    var result:String = ""
    var whole = number - number % 1
    
    while (whole > 0)
    {
        let remainder = whole % 2
        whole = floor(whole / 2)
        if remainder > 0 {
            result += "1"
        }
        else
        {
            result += "0"
        }
    }
    result = reverse(result) + "."

    var newNum:Float = number % 1
    while (newNum > 0)
    {
        newNum *= 2
        if newNum >= 1 {
            result += "1"
            newNum -= 1
        }
        else
        {
            result += "0"
        }
    }

    
    return result
}
let test:String = floatToBinaryString(132.224524563)
let testResult:Float = binaryStringToFloat(test)

let f:Float = binaryStringToFloat("1101.0110110101")
let s:String = floatToBinaryString(f)
