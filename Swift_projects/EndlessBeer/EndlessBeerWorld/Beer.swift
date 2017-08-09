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
        guard let id = dictionary[BeerResponseKey.id] as? Int,
            let name = dictionary[BeerResponseKey.name] as? String,
            let tagline = dictionary[BeerResponseKey.tagLine] as? String,
            let firstBrewed = dictionary[BeerResponseKey.firstBrewed] as? String,
            let beerDescription = dictionary[BeerResponseKey.description] as? String,
            let imageUrlString = dictionary[BeerResponseKey.imageUrl] as? String,
            let abv = dictionary[BeerResponseKey.abv] as? Double else { return }
        
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.beerDescription = beerDescription
        self.imageUrlString = imageUrlString
        self.abv = abv
        self.ibu = dictionary[BeerResponseKey.ibu] as? Double ?? 0.0
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }

}


