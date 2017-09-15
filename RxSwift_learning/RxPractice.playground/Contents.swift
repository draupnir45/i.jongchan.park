//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var array = Array(1...3)

for number in array {
    print(number)
    array = Array(4...6)
}

print(array) // for-loop 안에서 어레이는 카피되어 사용되기 때문에, 변화가 일어나지 않음

