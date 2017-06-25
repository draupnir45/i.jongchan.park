//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let someOptional: Int? = 42

switch someOptional {
case Optional.some(let x) :
    print(x, "with Switch-Case")
case Optional.none :
    print("No Value! with Switch-Case")
}



// Match using an enumeration case pattern.
if case .some(let x) = someOptional {
    print(x,"with Optional Pattern")
} else {
    print("No Value! with Optional Pattern")
}

// Match using an optional pattern.
if case let s? = someOptional {
    print(x)
}

//
if let x = someOptional {
    print(x)
}