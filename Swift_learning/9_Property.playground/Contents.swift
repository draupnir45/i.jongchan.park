//: Playground - noun: a place where people can play

import UIKit

struct PowerPoint {
    var x: Int
    var y: Int
}

let badPoint: PowerPoint = PowerPoint(x: 0, y: 0) //이니셜라이저의 자동 생성

class PowerPC {
    var operatingSys: String
    var centralProcessingUnit: String
    lazy var mainCase: String = "Apple Case" //지연 저장 프로퍼티 필수는 아니지만 쓰면 좋은.
    var applications: Array<String>?
    
    init(withOS os:String, CPU cpu: String) {
        self.operatingSys = os
        self.centralProcessingUnit = cpu
    }
    
    
    
}

let myComputer: PowerPC = PowerPC.init(withOS: "10.4", CPU: "PotatoChip") //커스텀 이니셜라이저를 '호출해야만' 합니다.

print(myComputer.mainCase)

