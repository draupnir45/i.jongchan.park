//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func add3(to int: Int) -> Int {
    return int + 3
}

//add3(to: Optional(2)) 오류!

var optionalSomeNumber: Int? = 100

optionalSomeNumber = optionalSomeNumber.map { add3(to: $0) } //Optional(103), 2번 연산

if let result = optionalSomeNumber {
    print(result)
}

var optionalNoneNumber: Int? = nil

optionalNoneNumber.map({ add3(to: $0) }) //nil, 연산 횟수는 없다?

var number: Int = optionalSomeNumber.flatMap { add3(to: $0) } ?? 0

print(number)

let possibleNumber: Int? = Int("6464")
let nonOverflowingSquare = possibleNumber.flatMap { x -> Int? in
    let (result, overflowed) = Int.multiplyWithOverflow(x, x)
    return overflowed ? nil : result
} //Optional.flatmap 안내 중에서...

let possibleNumberStringArray: [String] = ["2", "아닌데?", "103", "323"]

let numbers = possibleNumberStringArray.map { Int($0) }.flatMap { $0 }

print(numbers)

let oneLineSumWithFunctionChaining = possibleNumberStringArray.map { Int($0) }.flatMap { $0 }.reduce(0){ $0 + $1 }

print(oneLineSumWithFunctionChaining)


