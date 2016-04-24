// Playground - noun: a place where people can play

import Cocoa

class Tower:CustomStringConvertible {
    var disks:[Int] = []
    var index:Int!
    func push(disk:Int) {
        if !disks.isEmpty && disks[disks.endIndex - 1] >= disk {
            //error
        }
        else
        {
            disks.append(disk)
        }
    }
    func pop() -> Int! {
        if disks.isEmpty {
            return 0
        }
        return disks.removeLast()
        
    }
    init(index:Int) {
        self.index = index
    }
    func log() -> String {
        if disks.isEmpty {
            print("Tower: \(index)\nEmpty\n")
            return ""
        }
        let max:Int = disks[disks.endIndex - 1] + disks[disks.endIndex - 1] - 1
        var logString:String = "Tower: \(index)\n"
        
        for diskInt in disks {
            for _ in 0 ..< (max-diskInt) {
                logString += " "
            }
            for _ in 0 ..< diskInt + diskInt - 1 {
                logString += "_"
            }
            logString += "\n"
        }
        return logString
    }
    
    var description: String {
        return log()
    }
}

func moveTopDiskFrom(sourceTower sourceTower:Tower, destinationTower:Tower) {
    let topDisk:Int = sourceTower.pop()
    destinationTower.push(topDisk)
}

func movedDisks(diskCount diskCount:Int, sourceTower:Tower, destinationTower:Tower, tempTower:Tower) {
    guard diskCount > 0 else {
        return
    }
    movedDisks(diskCount: diskCount - 1, sourceTower: sourceTower, destinationTower: tempTower, tempTower: destinationTower)
    moveTopDiskFrom(sourceTower: sourceTower, destinationTower: destinationTower)
    movedDisks(diskCount: diskCount - 1, sourceTower: tempTower, destinationTower: destinationTower, tempTower: sourceTower)
}

var tower1:Tower = Tower(index: 1)
for index in 1...7 {
    tower1.push(index)
}
var tower2:Tower = Tower(index: 2)
var tower3:Tower = Tower(index: 3)
tower1.log()
tower2.log()
tower3.log()

movedDisks(diskCount: 7, sourceTower: tower1, destinationTower: tower3, tempTower: tower2)

tower1.log()
tower2.log()
tower3.log()
