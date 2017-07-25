//
//  DataCenter.swift
//  EndlessBeerWorld
//
//  Created by 박종찬 on 2017. 7. 18..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

fileprivate let rootUrl: String = "https://api.punkapi.com/v2/beers"
fileprivate let beerPerPage: Int = 26
typealias BeerDataCompletion = (Bool) -> Void

let initialFetchNotificationName = NSNotification.Name.init(rawValue: "InitialFetch")

class DataCenter {
    
    //싱글턴
    static let shared: DataCenter = DataCenter.init()
    
    private(set) var dataArray = realm.objects(Beer.self)
    
    private var persistedPageIndex: Int
    var shouldRequestPageToServer: Bool = true
    var isRequesting: Bool = false {
        didSet {
            UIApplication.shared.isNetworkActivityIndicatorVisible = self.isRequesting
        }
    }
    
    //계속 0 이다가 페이지당 아이템 개수보다 불러온 개수가 작아질때만 그 개수를 기억함.
    private var lastPageItemCount: Int
    
    private init() {
        self.persistedPageIndex = UserDefaults.standard.integer(forKey: "persistedPageIndex")
        self.lastPageItemCount = UserDefaults.standard.integer(forKey: "lastPageItemCount")
        if self.persistedPageIndex == 0 {
            self.getNewPage(completion: { (success) in
                if success {
                    NotificationCenter.default.post(name: initialFetchNotificationName, object: nil)
                }
            })
        }
        
    }
    
    private func loadBeerData(page:Int, completion: @escaping BeerDataCompletion) {
        
        self.isRequesting = true
        
        //URL
        let urlString: String = rootUrl + "?page=\(page)&per_page=\(beerPerPage)"
        let url: URL = URL.init(string: urlString)!
        
        
        //URLSession
        let session: URLSession = URLSession.init(configuration: URLSessionConfiguration.default)
        
        //URLRequest
        let request: URLRequest = URLRequest.init(url: url)
        
        //URLSessionTask
        let task: URLSessionTask = session.dataTask(with: request) { [unowned self] (data: Data?, response: URLResponse?, error: Error?) in
            let statusCode: Int = (response as! HTTPURLResponse).statusCode
            let rawArray: [[String:Any]] = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSArray) as! [[String:Any]]
            
            if error == nil {
                if statusCode == 200 {
                    if rawArray.count > self.lastPageItemCount {
                        OperationQueue.main.addOperation {
                            _ = rawArray.map({ (dictionary) in
                                let item: Beer = Beer.init(dictionary: dictionary)
                                addToRealm(item)
                            })
                            
                            if rawArray.count < beerPerPage {
                                self.lastPageItemCount = rawArray.count
                                UserDefaults.standard.set(rawArray.count, forKey: "lastPageItemCount")
                            }
                            
                            print("total:", self.dataArray.count)
                            completion(true)
                        }
                    } else {
                        completion(false)
                        self.shouldRequestPageToServer = false
                    }
                }
            } else {
                print(error!)
            }
            self.isRequesting = false
            
        }
        task.resume()
    }
    
    func getNewPage(completion: BeerDataCompletion?) {
        
        if self.dataArray.count == persistedPageIndex * beerPerPage {
            let nextPage: Int = persistedPageIndex + 1
            
            loadBeerData(page: nextPage) { [unowned self] (success) in
                if success {
                    UserDefaults.standard.set(nextPage, forKey: "persistedPageIndex")
                    self.persistedPageIndex = nextPage
                    
                    if let completion = completion {
                        completion(true)
                    }
                    
                }
            }
        }
    }
    
    func reloadDatas() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch  {
            print(error)
        }
        
        self.persistedPageIndex = 0
        UserDefaults.standard.set(0, forKey: "persistedPageIndex")
        
        self.lastPageItemCount = 0
        UserDefaults.standard.set(0, forKey: "lastPageItemCount")
        
        self.shouldRequestPageToServer = true
        UserDefaults.standard.set(true, forKey: "shouldRequestPageToServer")
        
    }
    
}


//MARK: - Realm Database

fileprivate let realm: Realm = try! Realm()

fileprivate func addToRealm<T: Object>(_ item: T) {
    do {
        try realm.write {
            realm.add(item)
        }
    } catch {
        print(error)
    }
}
