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
        dataArray = UserDefaults.standard.array(forKey: DataKeys.dataArrayKey) as? [[String:Any]] ?? []
    }
    
}

struct DataKeys {
    static let dataArrayKey = "DataArray"
}
