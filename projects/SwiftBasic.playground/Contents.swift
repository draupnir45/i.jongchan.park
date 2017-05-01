//: Playground - noun: a place where people can play

import UIKit

func sum(first:Int) -> ((Int) -> Int) {
    return { second in first + second }
}

sum(first: 9)(11)

let names:[String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards (first: String, second:String) -> Bool {
    return first > second
}

//let reversed: [String] = names.sorted(by: backwards)

let reversedFull: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})

let reversedAuto: [String] = names.sorted { (first, second) -> Bool in
    return first > second
}

let reversed: [String] = names.sorted { first, second in
    return first > second
}

let rvsd: [String] = names.sorted {
    return $0 > $1
}

let rv: [String] = names.sorted {
    $0 > $1
}

let r: [String] = names.sorted(by: >)

let 한국_이름들 = ["박종찬", "배병준", "조영진", "정준민", "김윤서", "조봉기"]

let 정렬된_한국이름 = 한국_이름들.sorted(by: <)


let height = 174.5

Int.max
UInt.max
Int.min
UInt.min

let a: Int = 10
let b: Int = 11

let c: Int = a - b

let longNumbFloat: Float = 1234567890.1
let longNumbDouble: Double = 1234567890.1
print(longNumbFloat, longNumbDouble)

let 한글_변수_이름: Character = "A"

let sampleString: String = "샘플입니다. 한글로 써 봤습니다."
sampleString.characters.count
sampleString.lengthOfBytes(using: String.Encoding.utf8)
sampleString.isEmpty

let unicodeScalaValue: String = "\u{2665}"
