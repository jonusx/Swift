// Playground - noun: a place where people can play

import Cocoa

class Tower {
    var disks:[Int] = []
    var index:Int!
    func push(disk:Int) {
        if !disks.isEmpty && disks[disks.endIndex - 1] >= disk {
            //error
        }
        else
        {
            disks += disk
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
    func log() {
        if disks.isEmpty {
            println("Tower: \(index)\nEmpty\n")
            return
        }
        let max:Int = disks[disks.endIndex - 1] + disks[disks.endIndex - 1] - 1
        var logString:String = "Tower: \(index)\n"
        
        for diskInt in disks {
            for var index = 0; index < (max-diskInt); index++ {
                logString += " "
            }
            for var index = 0; index < diskInt + diskInt - 1; index++ {
                logString += "_"
            }
            logString += "\n"
        }
        println(logString)
    }
}

func moveTopDiskFrom(#sourceTower:Tower, #destinationTower:Tower) {
    let topDisk:Int = sourceTower.pop()
    destinationTower.push(topDisk)
}

func movedDisks(#diskCount:Int, #sourceTower:Tower, #destinationTower:Tower, #tempTower:Tower) {
    if diskCount > 0 {
        movedDisks(diskCount: diskCount - 1, sourceTower: sourceTower, destinationTower: tempTower, tempTower: destinationTower)
        moveTopDiskFrom(sourceTower: sourceTower, destinationTower: destinationTower)
        movedDisks(diskCount: diskCount - 1, sourceTower: tempTower, destinationTower: destinationTower, tempTower: sourceTower)
    }
}

var tower1:Tower = Tower(index: 1)
for var index = 1; index <= 7; index++ {
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
