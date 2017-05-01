//: Playground - noun: a place where people can play

import UIKit

func sum(first:Int) -> ((Int, Int) -> Int) {
    return {second, third in
        return first + second + third
    }
}

sum(first: 9)(10, 1)
sum(first: 9)

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
