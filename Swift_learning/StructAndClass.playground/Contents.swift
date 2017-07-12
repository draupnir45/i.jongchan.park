//: Playground - noun: a place where people can play

import UIKit

struct PersonStruct {
    let id: Int
    var name: String
    var age: Int
}

class PersonClass {
    let id: Int
    var name: String
    var age: Int
    
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}


let structPerson: PersonStruct = PersonStruct.init(id: 1, name: "Steve", age: 20)
let classPerson: PersonClass = PersonClass.init(id: 1, name: "Steve", age: 20)

print(structPerson.name)
print(classPerson.name)


var classArray: [PersonClass] = [PersonClass.init(id: 1, name: "Steve", age: 20), PersonClass.init(id: 2, name: "Jongchan", age: 21), PersonClass.init(id: 3, name: "Jony", age: 22)]
var jobsClass: PersonClass = classArray[0]
classArray.append(PersonClass.init(id: 4, name: "Kim", age: 25))

print(classArray[0].name)
classArray[0].name = "Jobs"
print(classArray[0].name)
print(jobsClass.name, "중요")

jobsClass.age = 5
print(classArray[0].age)

var structArray: [PersonStruct] = [PersonStruct.init(id: 1, name: "Steve", age: 20), PersonStruct.init(id: 2, name: "Jongchan", age: 21), PersonStruct.init(id: 3, name: "Jony", age: 22)]
let jobsStruct: PersonStruct = structArray[0]

print(structArray[0].name)
structArray[0].name = "Jobs"
print(structArray[0].name)
print(jobsStruct.name, "중요")


struct UserPostDataKeys {
    static let userId: String = "user_id"
    static let userName: String = "user_name"
    static let contentDictionary: String = "content"
    static let writtenDate: String = "creation_date"
}

