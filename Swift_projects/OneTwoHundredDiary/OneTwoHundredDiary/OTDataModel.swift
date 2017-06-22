//
//  OTDataModel.swift
//  OneTwoHundredDiary
//
//  Created by 박종찬 on 2017. 6. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

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
