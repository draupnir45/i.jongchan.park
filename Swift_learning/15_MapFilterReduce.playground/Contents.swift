//: Playground - noun: a place where people can play

import UIKit
//: - Map
var numbers: [Int] = []

for i in 1...10 {
   numbers.append(Int(arc4random_uniform(100)))
}

print(numbers)

var doubled: [Int] = numbers.map { (i: Int) -> Int in
    return i * 2
}

print(doubled)

var dbld: [Int] = numbers.map({$0 * 2})

print(dbld)

//알겠는데 어디 쓰지..?
//: - Filter
let evens: [Int] = numbers.filter { (i: Int) -> Bool in
    return i % 2 == 0
}

print(evens)
//: - Reduce
var sum: Int = evens.reduce(0) { (result: Int, i: Int) -> Int in
    return result + i
}

print(sum)