// Playground - noun: a place where people can play

import Foundation

class MRCNode: NSObject {
    var value:Int?
    var leftNode:MRCNode?
    var rightNode:MRCNode?
}

func createTree(#numbers:Int[], #low:Int, #high:Int) -> MRCNode! {
    if low > high {
        return nil
    }
    
    let mid:Int = (low + high) / 2;
    var node:MRCNode = MRCNode()
    
    node.value = numbers[mid];
    node.leftNode = createTree(numbers: numbers, low: low, high: mid - 1)
    node.rightNode = createTree(numbers: numbers, low: mid + 1, high: high)
    return node;
}

func intransverseNode(node:MRCNode!) {
    if !node {
        return
    }
    
    intransverseNode(node.leftNode)
    println("In Visit \(node.value)")
    intransverseNode(node.rightNode)
}

func pretransverseNode(node:MRCNode!) {
    if !node {
        return
    }
    
    println("Pre Visit \(node.value)")
    pretransverseNode(node.leftNode)
    pretransverseNode(node.rightNode)
}

func posttransverseNode(node:MRCNode!) {
    if !node {
        return
    }
    
    posttransverseNode(node.leftNode)
    posttransverseNode(node.rightNode)
    println("Post Visit \(node.value)")
}

func breadthtransverseNode(node:MRCNode!) {
    if !node {
        return
    }
    
    var queue:MRCNode[] = [node]
    var transversingNode:MRCNode?
    
    while !queue.isEmpty {
        transversingNode = queue[queue.endIndex - 1];
        println("Breadth Visit \(transversingNode!.value)")
        let v = transversingNode!.value
        queue.removeLast()
        
        if (transversingNode!.leftNode) {
            queue.insert(transversingNode!.leftNode!, atIndex: 0)
        }
        
        if (transversingNode!.rightNode) {
            queue.insert(transversingNode!.rightNode!, atIndex: 0)
        }
    }
    
    queue.removeAll(keepCapacity: false);
}

var array:Int[] = Int[]()

for index:Int in 0..10 {
    array += index
}

let node:MRCNode = createTree(numbers: array, low: 0, high: array.count - 1)
intransverseNode(node)
posttransverseNode(node)
pretransverseNode(node)
breadthtransverseNode(node)
