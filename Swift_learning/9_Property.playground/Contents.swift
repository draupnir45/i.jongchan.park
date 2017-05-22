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



//연산 프로퍼티
struct CoordinatePoint {
    var x: Int
    var y: Int
    
    var opposite: CoordinatePoint {
        
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        set {
            x = -newValue.x
            y = -newValue.y
        }
        
    }
    
    var verticalMirrored: CoordinatePoint {
        get {
            return CoordinatePoint(x: x, y: -y)
        }
        
        set {
            x = newValue.x
            y = -newValue.y
        }
    }
}


var point: CoordinatePoint = CoordinatePoint(x: 10, y: 10)

dump(point.opposite) //get

point.opposite = CoordinatePoint(x: -20, y: -20) //(간접)set

dump(point) //go

point.verticalMirrored = CoordinatePoint(x: 10, y: 10)

dump(point)


//프로퍼티 옵저버
class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변화합니다.")
        }
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변화했습니다.")
            //여기에 레이블 등을 연동시킬 수 있을 것 같음.
        }
    }
    
    var dollarCredit : Double {
        get {
            return Double(credit) / 1000.0
        }
        set {
            credit = Int(newValue * 1000)
            print("잔액을 $\(newValue)로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account {
    
    static var exchangeRate = 1123
    
    override var dollarCredit: Double {
        willSet {
            print("잔액이 $\(dollarCredit)에서 $\(newValue)으로 변화합니다.")
        }
        
        didSet {
            print("잔액이 $\(oldValue)에서 $\(dollarCredit)으로 변화했습니다.")
        }
    }
}

var koreanUser: Account = Account()
koreanUser.credit = 1000

var foreignUser: ForeignAccount = ForeignAccount()
foreignUser.dollarCredit = 10.5

