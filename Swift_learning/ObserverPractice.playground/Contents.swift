//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class TestClass {
  var testProperty: Int {
    didSet {
      print("\(oldValue)가 \(testProperty)로 세팅되었습니다.")
    }
    willSet {
      print("\(testProperty)가 \(newValue)로 바뀝니다.")
    }
  }
  
  init() {
    self.testProperty = 1
  }
}

let testObject = TestClass()

testObject.testProperty += 1
testObject.testProperty += 1
testObject.testProperty += 1
testObject.testProperty += 1