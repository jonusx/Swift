// Playground - noun: a place where people can play

import Cocoa

let palindromeStrings:[String] = ["I, madam. I made radio! So I dared! Am I mad? Am I?", "A man, a plan, a canal -- Panama!"]

extension String {
    func characterAtIndex(index:Int) -> Character {
        return self[startIndex.advancedBy(index)]
    }
}

func cleanString(string:String) -> String? {
    let regex:NSRegularExpression = try! NSRegularExpression(pattern:"[^a-zA-Z0-9]", options:.CaseInsensitive)
    return regex.stringByReplacingMatchesInString(string, options: [], range: NSRange(location: 0, length: string.characters.count), withTemplate: "")
}

func isPalindrome(string:String) -> Bool {
    let string = string.lowercaseString
    let stringCount = string.characters.count
    
    for index in 0 ..< stringCount/2 {
        if string.characterAtIndex(index) != string.characterAtIndex(stringCount - 1 - index) {
            return false;
        }
    }
    return true;
}


let test = isPalindrome("poaop")

func allPalindromes(string:String) -> [String]? {
    
    let cleanedString:String = cleanString(string)!
    
    var stringPlaceholder:String = ""
    var resultArray:[String] = [String]()
    let stringCount = cleanedString.characters.count
    for index in 0 ..< stringCount {
        stringPlaceholder = ""
        stringPlaceholder.append(cleanedString.characterAtIndex(index))
        for subIndex in index+1 ..< stringCount {
            stringPlaceholder.append(cleanedString.characterAtIndex(subIndex))
            if isPalindrome(stringPlaceholder) {
                resultArray.append(stringPlaceholder)
            }
        }
    }
    return resultArray
}

let results = allPalindromes("Are we not pure? “No sir!” Panama’s moody Noriega brags. “It is garbage!” Irony dooms a man; a prisoner up to new era.")


let theCount = results?.count

