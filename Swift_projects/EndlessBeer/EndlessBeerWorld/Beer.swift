//
//  Beer.swift
//  EndlessBeerWorld
//
//  Created by 박종찬 on 2017. 7. 18..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import Foundation
import RealmSwift
import Realm


final class Beer: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var tagline: String = ""
    dynamic var firstBrewed: String = ""
    dynamic var beerDescription: String = ""
    dynamic var imageUrlString: String = ""
    dynamic var abv: Double = 0.0
    dynamic var ibu: Double = 0.0
    
    convenience init(dictionary: [String:Any]) {
        self.init()
        self.id = dictionary[BeerResponseKey.id] as! Int
        self.name = dictionary[BeerResponseKey.name] as! String
        self.tagline = dictionary[BeerResponseKey.tagLine] as! String
        self.firstBrewed = dictionary[BeerResponseKey.firstBrewed] as! String
        self.beerDescription = dictionary[BeerResponseKey.description] as! String
        self.imageUrlString = dictionary[BeerResponseKey.imageUrl] as! String
        self.abv = dictionary[BeerResponseKey.abv] as! Double
        self.ibu = dictionary[BeerResponseKey.ibu] as? Double ?? 0.0
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }

}


