// Playground - noun: a place where people can play

import Cocoa

func isAnagram(string1 string1:String, string2:String) -> Bool {
    if string1.characters.count != string2.characters.count { return false }
    
    var counts:Dictionary = Dictionary<String, Int>()
    var uniqueCharacters:Int = 0
    var completedCharacters:Int = 0
    
    for letter in string1.characters {
        if counts[String(letter)] == nil || counts[String(letter)] == 0 {
            counts[String(letter)] = 1
            uniqueCharacters += 1
        }
        else
        {
            counts[String(letter)] = counts[String(letter)]! + 1
        }
    }
    
    var index:Int = 0
    for letter in string2.characters {
        if counts[String(letter)] == nil || counts[String(letter)] == 0 {
            return false
        }
        
        counts[String(letter)] = counts[String(letter)]! - 1
        
        if counts[String(letter)] == 0 {
            completedCharacters += 1
            if completedCharacters == uniqueCharacters  && index == string2.characters.count - 1 {
                return true
            }
        }
        index += 1
    }
    
    return false
}


isAnagram(string1: "abc", string2: "cba")
isAnagram(string1: "red", string2: "black")
isAnagram(string1: "aaa", string2: "aba")
isAnagram(string1: "lets go home", string2: "emoh og stel")
