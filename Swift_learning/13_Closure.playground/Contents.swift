//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//이름을 가진 형태
func normalFunctionClosure(with a:String, _ b:String) -> Bool {
    return a == b
}

//이름은 없고, 따로 변수에 할당되서 그 이름으로 사용 가능
let isEqualStr = {(a:String, b:String) -> Bool in
    return a == b
}

//사용 가능!
if isEqualStr("aa","aa") {
    print("된다!")
}

typealias Incrementor = ()->Int

//캡처하는 광경
func makeIncrementor(for amount: Int) -> (()->Int) {
    var totalVariableForCapturing: Int = 0
    func resultClosure() -> Int {
        totalVariableForCapturing += amount
        return totalVariableForCapturing
    }
    return resultClosure
}

let incrementor2: Incrementor = makeIncrementor(for: 2)

print(incrementor2()) // 2
print(incrementor2()) // 4
print(incrementor2()) // 6
print(incrementor2()) // 8

//전달받은 클로저가 외부로 나갈 수 있기 때문에 @escaping 키워드 필요.
func checkEvenIncrementor(_ array: [Incrementor], _ incrementor: @escaping Incrementor) -> [Incrementor] {
    
    let firstInt: Int = incrementor()
    let secondInt: Int = incrementor()
    if (secondInt - firstInt) % 2 == 0 {
        var resultArray = array
        resultArray.append(incrementor)
        return resultArray
    } else {
        return array
    }
}

func someOtherFunction(closure:@escaping Incrementor) {
    checkEvenIncrementor(evenIncrementorArray, closure)
}

var evenIncrementorArray: [Incrementor] = []

for i in 1...30 {
    let incrementor: Incrementor = makeIncrementor(for: i)
    evenIncrementorArray = checkEvenIncrementor(evenIncrementorArray, incrementor)
}

for incrementor in evenIncrementorArray {
    print("\(incrementor()/3)")
}

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let customerClosure: () -> String = {customersInLine.remove(at: 0)}
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
func serveByStr(customer customerProvider: String) {
    print("Now serving \(customerProvider)!")
}
serve(customer: customersInLine.remove(at: 0))
serve(customer: customerClosure())
serveByStr(customer: customersInLine.remove(at: 0)) //뭐가 다른거야...


