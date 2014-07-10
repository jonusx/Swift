// Playground - noun: a place where people can play

import Cocoa

let palindromeStrings:[String] = ["I, madam. I made radio! So I dared! Am I mad? Am I?", "A man, a plan, a canal -- Panama!"]

extension String {
    func characterAtIndex(index:Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
}

func cleanString(string:String) -> String? {
    let regex:NSRegularExpression = NSRegularExpression.regularExpressionWithPattern("[^a-zA-Z0-9]", options:.CaseInsensitive, error:nil);
    return regex.stringByReplacingMatchesInString(string, options: nil, range: NSRange(location: 0, length: countElements(string)), withTemplate: "")
}

func isPalindrome(string:String) -> Bool {
    let stringCount = countElements(string)
    
    for var index = 0; index < stringCount/2; index++ {
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
    for var index = 0, stringCount = countElements(cleanedString); index < stringCount; index++ {
        stringPlaceholder = ""
        stringPlaceholder += cleanedString.characterAtIndex(index)
        for var subIndex = index+1; subIndex < stringCount; subIndex++ {
            stringPlaceholder += cleanedString.characterAtIndex(subIndex)
            if isPalindrome(stringPlaceholder) {
                resultArray += stringPlaceholder
            }
        }
    }
    return resultArray
}

let results = allPalindromes("Are we not pure? “No sir!” Panama’s moody Noriega brags. “It is garbage!” Irony dooms a man; a prisoner up to new era.")

let theCount = results?.count

