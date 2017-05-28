//
//  main.swift
//  FreakingAutoClosure
//
//  Created by 박종찬 on 2017. 5. 28..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

print("클로저버전")


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let customerClosure: () -> String = {customersInLine.remove(at: 0)}
func serve(customer customerProvider: @autoclosure () -> String) {
    print(customersInLine, "실행함수안, 실행전")
    print("Now serving \(customerProvider())!")
    print(customersInLine, "실행함수안, 실행후")
}
func serveByStr(customer customerProvider: String) {
    print(customersInLine, "스트링버전실행함수안, 실행전")
    print("Now serving \(customerProvider)!")
    print(customersInLine, "스트링버전실행함수안, 실행후")
}

print(customersInLine, "실행전")
serve(customer: customersInLine.remove(at: 0))
print("\n\n스트링버전")
print(customersInLine, "실행전")
serveByStr(customer: customersInLine.remove(at: 0))
