// Playground - noun: a place where people can play

import Foundation

extension String {
    func characterAtIndex(index:Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
}

extension String {
    subscript (aRange:Range<Int>) -> String? {
        get {
            if ((aRange.startIndex < 0) || aRange.endIndex > countElements(self))
            {
                println("Error. Range [\(aRange.startIndex)..\(aRange.endIndex)] is out of bounds in string \"\(self)\".")
                return nil
            }
            var start = advance(self.startIndex, aRange.startIndex)
            var end = advance(self.startIndex, aRange.endIndex)
            return self[Range(start: start, end: end)]
        }
    }
}

func histogramWithString(string:String) -> NSCountedSet {
    var histogram:NSCountedSet = NSCountedSet()
    for character in string {
        histogram.addObject(String(character))
    }
    return histogram
}

func indexesOfPermuentationsOfString(smallString:String, inside bigString:String) -> [Int] {
    var results:Array = [Int]();
    
    let smallStringLength = countElements(smallString)
    let bigStringLength = countElements(bigString)
    
    if smallStringLength > bigStringLength {
        return results
    }
    
    let smallStringHistogram:NSCountedSet = histogramWithString(smallString)
    var checkDictionary:Dictionary<String, Int> = Dictionary()
    
    var rollingHistogram:NSCountedSet = NSCountedSet.set()
    var correctCount:Int = 0
    
    for var index:Int = 0; index < bigStringLength; index++ {
        
        if index > smallStringLength - 1 {
            let stringToRemove = String(bigString.characterAtIndex(index - smallStringLength))
            rollingHistogram.removeObject(stringToRemove)
            
            if smallStringHistogram.countForObject(stringToRemove) > 0 && correctCount > 0 {
                if rollingHistogram.countForObject(stringToRemove) < smallStringHistogram.countForObject(stringToRemove) {
                    correctCount--
                }
            }
        }
        
        let stringToAdd:String = String(bigString.characterAtIndex(index))
        rollingHistogram.addObject(stringToAdd)
        
        if smallStringHistogram.countForObject(stringToAdd) > 0 && smallStringHistogram.countForObject(stringToAdd) >= rollingHistogram.countForObject(stringToAdd) {
            correctCount++
        }

        if correctCount == smallStringLength {
            results += index - smallStringLength + 1
        }
    }
    return results;
}

let indexes:[Int] = indexesOfPermuentationsOfString("ball", inside:"baballllllllhellotherethewaterisblueballoonsarefun.Theballisred.ballballbaballll");

