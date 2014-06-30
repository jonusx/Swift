// Playground - noun: a place where people can play

import Cocoa

func isAnagram(#string1:String, #string2:String) -> Bool {
    if countElements(string1) != countElements(string2) { return false }
    
    var counts:Dictionary = Dictionary<String, Int>()
    var uniqueCharacters:Int = 0
    var completedCharacters:Int = 0
    
    for letter in string1 {
        if !counts[String(letter)] || counts[String(letter)] == 0 {
            counts[String(letter)] = 1
            uniqueCharacters++
        }
        else
        {
            counts[String(letter)] = counts[String(letter)]! + 1
        }
    }
    
    var index:Int = 0
    for letter in string2 {
        if !counts[String(letter)] || counts[String(letter)] == 0 {
            return false
        }
        
        counts[String(letter)] = counts[String(letter)]! - 1
        
        if counts[String(letter)] == 0 {
            completedCharacters++
            if completedCharacters == uniqueCharacters  && index == countElements(string2) - 1 {
                return true
            }
        }
        index++
    }
    
    return false
}


isAnagram(string1: "abc", string2: "cba")
isAnagram(string1: "red", string2: "black")
isAnagram(string1: "aaa", string2: "aba")
isAnagram(string1: "lets go home", string2: "emoh og stel")