//
//  DataCenter.swift
//  OneTwoHundredDiary
//
//  Created by 박종찬 on 2017. 6. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

class OTDataCenter {
    static let sharedInstance: OTDataCenter = OTDataCenter()

    
    var dataArray: [[String:Any]] {
        get {
            return self.dataStoredArray
        }
        
        set(newArray) {
            self.dataStoredArray = newArray
            UserDefaults.standard.set(newArray, forKey: DataKeys.dataArrayKey)
        }
        
    }
    
    var dataStoredArray: [[String:Any]] = []
    
    init() {
//        dataArray = UserDefaults.standard.array(forKey: DataKeys.dataArrayKey) as? [[String:Any]] ?? []
        if let initializedData:[[String:Any]] = UserDefaults.standard.array(forKey: DataKeys.dataArrayKey) as? [[String:Any]] {
            self.dataArray = initializedData
        } else {
            self.dataArray = makeInitialArray()
        }
    }
    
    func makeInitialArray() -> [[String:Any]] {
        var resultArray: [[String:Any]] = []
        for i in 1...12 {
            let month = OTMonth(rawValue: i)!
            var dayArray: [String] = []
            for _ in 1...numberOfDay(withMonth: month) {
                dayArray.append("")
            }
            let monthDictionary: [String:Any] = [DataKeys.monthKey:titleOf(month: month), DataKeys.dayArrayKey:dayArray]
            resultArray.append(monthDictionary)
        }
        return resultArray
    }
    
}

struct DataKeys {
    static let dataArrayKey = "DataArray"
    static let monthKey = "Month"
    static let dayArrayKey = "DayArray"
}
