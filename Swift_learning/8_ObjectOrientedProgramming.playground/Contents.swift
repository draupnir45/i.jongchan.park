//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//단순 구조체 정의, 선언, 메서드 사용

struct YourStructName {
    var someProperty: String
    
    mutating func someMethod(someParam: String) -> Void {
        someProperty = someParam
    }
    
}

//init 메서드가 자동으로 생성
var structInstance: YourStructName = YourStructName.init(someProperty: "Hey!")

//내부에서 var로 프로퍼트를 지정한다 해도 인스턴스가 let이면 변경불가
structInstance.someMethod(someParam: "Wow!")


dump(structInstance)



//클래스 정의

class ParentClass {
    var lastName: String = "홍"
}

class Person: ParentClass {
    var firstName: String = "길동"
    
    func changeMyLastName(to newLastName: String) -> Void {
        print("에잇 내가 성을 간다.")
        self.lastName = newLastName
    }
    
    init(withFullname fullName: String) { //init 재정의
        super.init()
        self.lastName = fullName.substring(to: fullName.index(after: fullName.startIndex))
        self.firstName = fullName.substring(from: fullName.index(after: fullName.startIndex))
    }
    
    deinit {
        print("사라져주마!")
    }
    
}

extension Person: CustomStringConvertible {
    var description: String {
        return "내 이름은 \(lastName)\(firstName)입니다."
    }
}


var gildong: Person? = Person.init(withFullname: "홍길동")

print(gildong!)

//클래스의 인스턴스는 레퍼런스 타입이므로, let으로 정의해도 프로퍼티 자체가 var이면 다른 값을 할당 가능.

gildong!.changeMyLastName(to: "김")

print(gildong!)

gildong!.firstName = "동길"

print(gildong!)

var otherGildong: Person? = gildong!

print(otherGildong === gildong)

gildong = nil
otherGildong = nil //ARC에 의하여 이 타이밍에 사라짐



class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library: [MediaItem] = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

