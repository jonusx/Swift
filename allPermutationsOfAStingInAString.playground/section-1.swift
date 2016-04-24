// Playground - noun: a place where people can play

import Foundation

extension String {
    func characterAtIndex(index:Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

extension String {
    subscript (aRange:Range<Int>) -> String? {
        get {
            if ((aRange.startIndex < 0) || aRange.endIndex > self.characters.count) {
                print("Error. Range [\(aRange.startIndex)..\(aRange.endIndex)] is out of bounds in string \"\(self)\".")
                return nil
            }
            return self[Range(startIndex.advancedBy(aRange.startIndex)..<startIndex.advancedBy(aRange.endIndex))]
        }
    }
}

func histogramWithString(string:String) -> NSCountedSet {
    let histogram:NSCountedSet = NSCountedSet()
    for character in string.characters {
        histogram.addObject(String(character))
    }
    return histogram
}

func indexesOfPermuentationsOfString(smallString:String, inside bigString:String) -> [Int] {
    var results:Array = [Int]();
    
    let smallStringLength = smallString.characters.count
    let bigStringLength = bigString.characters.count
    
    if smallStringLength > bigStringLength {
        return results
    }
    
    let smallStringHistogram:NSCountedSet = histogramWithString(smallString)
    
    let rollingHistogram:NSCountedSet = NSCountedSet()
    var correctCount:Int = 0
    
    for index:Int in 0 ..< bigStringLength {
        
        if index > smallStringLength - 1 {
            let stringToRemove = String(bigString.characterAtIndex(index - smallStringLength))
            rollingHistogram.removeObject(stringToRemove)
            
            if smallStringHistogram.countForObject(stringToRemove) > 0 && correctCount > 0 {
                if rollingHistogram.countForObject(stringToRemove) < smallStringHistogram.countForObject(stringToRemove) {
                    correctCount -= 1
                }
            }
        }
        
        let stringToAdd:String = String(bigString.characterAtIndex(index))
        rollingHistogram.addObject(stringToAdd)
        
        if smallStringHistogram.countForObject(stringToAdd) > 0 && smallStringHistogram.countForObject(stringToAdd) >= rollingHistogram.countForObject(stringToAdd) {
            correctCount += 1
        }

        if correctCount == smallStringLength {
            results += [index - smallStringLength + 1]
        }
    }
    return results;
}

let indexes:[Int] = indexesOfPermuentationsOfString("ball", inside:"baballllllllhellotherethewaterisblueballoonsarefun.Theballisred.ballballbaballll");

