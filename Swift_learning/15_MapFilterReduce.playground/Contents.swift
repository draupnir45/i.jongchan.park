//: Playground - noun: a place where people can play

import UIKit
//: - Map
var numbers: [Int] = []

for i in 1...10 {
   numbers.append(Int(arc4random_uniform(100)))
}

print(numbers)

var doubled: [Int] = numbers.map({ (i: Int) in
    return i * 2
})

print(doubled)

var dbld: [Int] = numbers.map({$0 * 2})

print(dbld)


//: - Filter

//긴 버전
let evens: [Int] = numbers.filter { (i: Int) -> Bool in
    i % 2 == 0
}
print(evens)

//짧은 버전
let evn: [Int] = numbers.filter({$0 / 2 == 0})
print(evn)


//: - Reduce

//긴 버전
var reduced: Int = evens.reduce(0) { (result: Int, i: Int) -> Int in
    return result + i
}
print(reduced)

//짧은 버전
var rdcd: Int = evens.reduce(0, {$0 + $1})
print(rdcd)

