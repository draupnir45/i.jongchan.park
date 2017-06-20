//
//  OTDataCenter.swift
//  FileManagerPractice
//
//  Created by 박종찬 on 2017. 6. 19..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

let fileName: String = "OTData.plist"


class OTDataCenter: NSObject {
    static let defaultCenter: OTDataCenter = OTDataCenter()
    
    ///저장되는 파일의 Path
    let filePath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/" + fileName
    
    ///데이터 저장소
    private var rootData: [String:Any]
    
    ///시작하는 날. 로드할 때 넣어줌.
    var startDay: OTDiaryIndex?
    
    ///데이터 getter
    var data: [String:Any] {
        get {
            return rootData
        }
    }
    
    var needInitialize: Bool {
        get {
            if data.isEmpty {
                return true
            } else {
                return false
            }
        }
    }
    
    override init() {
        if let dictionaryFromFile = NSDictionary(contentsOfFile: filePath) as? [String:Any] {
            self.rootData = dictionaryFromFile
        } else {
            self.rootData = [String:Any]() //빈 데이터 할당
        }
    }
    
    func saveData() {
        let nsDictionary: NSDictionary = NSDictionary(dictionary: self.rootData)
        nsDictionary.write(toFile: filePath, atomically: true)
    }
    
    func initializeOTDiary(during term:Int) {
        var monthDataArray: [[String:Any]] = []
        self.startDay = OTDiaryIndex.init(withDate: Date())
        var term = term
        var month = startDay!.month
        
        monthDataArray.append(initialize(month: month, from: startDay!.day, term: term))
        month = month.next()
        term -= monthDataArray[0].count
        
        var index = 1
        
        while term > 0 {
            monthDataArray.append(initialize(month: month, term: term))
            month = month.next()
            term -= monthDataArray[index].count
            index += 1
        }
        
        rootData = ["startDay" : String(describing: startDay), "term" : term, "content" : monthDataArray]
        saveData()
    }
    
    func initialize(month: OTMonth, from startDay: Int = 1, term: Int) -> [String:Any] {
        var array: [String] = []
        if term > month.numberOfDay() {
            for _ in startDay...month.numberOfDay() {
                array.append("")
            }
        } else {
            for _ in startDay...term {
                array.append("")
            }
        }
        
        return ["month" : month.rawValue, "contents" : array]
    }
    
}

struct OTDiaryIndex {
    let month: OTMonth
    let day: Int
    
    init(withDate date: Date) {
        let calendar: Calendar = Calendar.current
        self.month = OTMonth(rawValue: calendar.component(.month, from: date))!
        self.day = calendar.component(.day, from: date)
    }
    
    init(month: Int, day: Int) {
        self.month = OTMonth(rawValue: month)!
        self.day = day
    }
}


enum OTMonth: Int {
    
    case january = 1
    
    case february = 2
    
    case march = 3
    
    case april = 4
    
    case may = 5
    
    case june = 6
    
    case july = 7
    
    case august = 8
    
    case september = 9
    
    case october = 10
    
    case november = 11
    
    case december = 12
    
    
    func numberOfDay() -> Int {
        switch self {
        case .january, .march, .may, .july, .august, .october, .december:
            return 31
        case .february:
            return 28
        case .april, .june, .september, .november:
            return 30
        }
    }
    
    func next() -> OTMonth {
        if self.rawValue == 12 {
            return OTMonth.january
        } else {
            return OTMonth.init(rawValue: self.rawValue + 1)!
        }
    }
    
    func getTitle() -> String {
        switch self {
        case .january:
            return "January"
        case .february:
            return "February"
        case .march:
            return "March"
        case .april:
            return "April"
        case .may:
            return "May"
        case .june:
            return "June"
        case .july:
            return "July"
        case .august:
            return "August"
        case .september:
            return "September"
        case .october:
            return "October"
        case .november:
            return "November"
        case .december:
            return "December"
            
        }
    }
    
}
