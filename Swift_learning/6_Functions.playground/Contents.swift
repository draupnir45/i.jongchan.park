//: Playground - noun: a place where people can play

import UIKit
//기본값 테스트. 자동완성에서도 지원됨.

typealias Comicbook = (title: String, volume: Int)
var landedBooks: [Comicbook] = []


func getComicbooks(named title: String, numbOfBooks count: Int, from volume: Int = 1) -> [Comicbook] {
    var returnArray: [Comicbook] = []
    let targetVolume: Int = volume + count
    var currentVolume = volume
    while targetVolume > currentVolume {
        let book: Comicbook = (title, currentVolume)
        returnArray.append(book)
        
        currentVolume += 1
    }
    
    return returnArray
}

var fullMetalPanic = getComicbooks(named: "강철의 연금술사", numbOfBooks: 10)
var detectiveConan = getComicbooks(named: "명탐정 코난", numbOfBooks: 10, from: 71)

//func process(book: Comicbook) {
//    if landedBooks.contains(where: ==) {
//        let index = landedBooks.index(where: ==)
//        landedBooks.remove(at: index!)
//    } else {
//        landedBooks.append(book)
//    }
//}

func landMeComicbooks(with arrays: [Comicbook]...) {
    
    print("다음 책을 대여합니다.")
    var totalCount = 0
    
    
    for comicbookArray in arrays {
        print(comicbookArray)
//        for book in comicbookArray {
////            process(book: book)
//        }
        totalCount += comicbookArray.count
    }
    
    print("총 \(totalCount)권")
    
}


landMeComicbooks(with: fullMetalPanic, detectiveConan)
//
//process(book: fullMetalPanic[0])
//
//print(landedBooks)
