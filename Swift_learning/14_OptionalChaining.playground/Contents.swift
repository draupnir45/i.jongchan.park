//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


struct Badge {
    let gymName: String
    let effectLevel: Int
}

struct Bag {
    var badgeCase: [Badge]?
}

class Trainer {
    var bag: Bag = Bag()
}



let ash: Trainer?

ash = Trainer()

ash?.bag.badgeCase = []
let grayBadge: Badge = Badge(gymName: "grayCityGym", effectLevel: 20)

//옵셔널인 놈에게만 궁금증을 가진다!
ash?.bag.badgeCase?.append(grayBadge)

//바인딩과 함께 바인딩!
if let firstBadge = ash?.bag.badgeCase?[0] {
    print(firstBadge)
}