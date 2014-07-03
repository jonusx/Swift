// Playground - noun: a place where people can play

import Cocoa

var queens:Int[] = Int[](count:8, repeatedValue:-1)

var solutionList:String[] = String[]()

func logQueens(queens:Int[]) -> String {
    var result:String = "\n"
    let count:Int = countElements(queens)
    for index in 0..count {
        for index1 in 0..count {
            if queens[index] == index1 {
                result += "Q"
            }
            else
            {
                result += "-"
            }
        }
        result += "\n"
    }
    result += "\n"
    return result
}

func canPlaceQueen(#row:Int, #column:Int) -> Bool {
    for prevColumn in 0..column {
        if (queens[prevColumn] == -1) {
            return true
        }
        if queens[prevColumn] == row || abs(queens[prevColumn] - row) == column - prevColumn {
            return false
        }
    }
    return true
}

func placeQueen(column:Int) {
    if column == 8 {
        solutionList += logQueens(queens)
        return
    }
    for row in 0..8 {
        if canPlaceQueen(row: row, column: column) {
            queens[column] = row
            placeQueen(column + 1)
        }
    }
}

placeQueen(0)

println(solutionList)
