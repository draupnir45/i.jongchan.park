//: Playground - noun: a place where people can play

import UIKit

enum TestCase {
    case firstCase
    case secondCase
    case defaultCase
    
    init() {
        self = .defaultCase
    }
    
}

//두 가지 기본초깃값 지정 방법
struct TestStruct {
    let property1: Int = 0
    let property2: Int
    let property3: TestCase = {
       return TestCase.firstCase
    }()
    
    init() {
        self.property2 = 1
    }
}

var myStruct:TestStruct = TestStruct.init() //자동 멤버와이즈 이니셜라이저가 없어짐.

class TestClass {
    let constProp1:Int = 0
    let constProp2:Int
    init() {
        constProp2 = 1
    }
}



enum RecipeCost {
    
    case under10
    case over10Under20
    case over20Under30
    case over30
    
    init?(with cost:Double){
        if cost <= 10.0 {
            self = .under10
        } else if cost > 10.0 && cost <= 20.0 {
            self = .over10Under20
        } else if cost > 20.0 && cost <= 30.0 {
            self = .over20Under30
        } else if cost > 30.0 {
            self = .over30
        } else {
            return nil
        }
    }
    
    init?(withKRW koreanWonCost: Int) {
        let dollarCost: Double = Double(koreanWonCost) / 1123.4
        self.init(with: dollarCost)
    }
}


let cost:RecipeCost? = RecipeCost.init(withKRW: 24000)


