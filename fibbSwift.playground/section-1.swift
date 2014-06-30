// Playground - noun: a place where people can play

import Cocoa

func memoize<T: Hashable, U>(body:((T)->U, T) -> U) -> (T)->U {
    var memo = Dictionary<T, U>()
    var result: ((T)->U)!
    result = { x in
        if let q = memo[x] { return q }
        let r = body(result, x)
        memo[x] = r
        return r
    }
    return result
}

var fibonacciMemo = Dictionary<Int, Double>()

func fibonacci(n:Int) -> Double {
    if let result = fibonacciMemo[n] {
        return result
    }
    let result = n < 2 ? Double(n) : fibonacci(n - 1) + fibonacci(n - 2)
    fibonacciMemo[n] = result
    return result
}

let phi = fibonacci(45) / fibonacci(44)

//let fibb = memoize { fibb,  }

let factorial = memoize { factorial, x in x == 0 ? 1 : x * factorial(x - 1) }
//let fibonacci = memoize({ fibonacci, n < 2 ? Double(n) : fibonacci(n - 1) + fibonacci(n - 2) })
//
//let phi = fibonacci(45) / fibonacci(44)
factorial(5)
