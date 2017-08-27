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

let initialFetchNotificationName = NSNotification.Name.init(rawValue: "InitialFetch")

class DataCenter {
    
    //싱글턴
    static let shared: DataCenter = DataCenter.init()
    
    private(set) var dataArray = realm.objects(Beer.self)
    private let rootUrl: String = "https://api.punkapi.com/v2/beers"
    private let beerPerPage: Int = 26
    typealias BeerDataCompletion = (Bool) -> Void
    
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
    
    private func loadBeerData(page: Int, completion: @escaping BeerDataCompletion) {
        
        self.isRequesting = true
        
        //URL
        let urlString: String = rootUrl + "?page=\(page)&per_page=\(beerPerPage)"
        guard let url: URL = URL.init(string: urlString) else { return }
        
        //URLRequest
        let request: URLRequest = URLRequest.init(url: url)
        
        //URLSessionTask
        URLSession.shared.dataTask(with: request) { [unowned self] data, response, error in
            //에러가 있으면 종료. 재시도 요청.
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse,
                let status = NetworkResponse.init(rawValue: response.statusCode) else { return }

            switch status {
            case NetworkResponse.success:
                var rawArray: [[String:Any]] = []
                
                do {
                    let nsArray = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let array: [[String:Any]] = nsArray as? [[String:Any]] {
                        rawArray = array
                    } else {
                        //데이터 캐스팅 실패
                    }
                } catch {
                    //데이터 변환 실패. 재시도 요청.
                    print(error)
                }
                
                if rawArray.count > self.lastPageItemCount {
                    OperationQueue.main.addOperation {
                        _ = rawArray.map({ (dictionary) in
                            let item: Beer = Beer.init(dictionary: dictionary)
                            self.addToRealm(item)
                        })
                        
                        if rawArray.count < self.beerPerPage {
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
            case NetworkResponse.fail:
                print(response, data)
            }
            
            self.isRequesting = false
            
        }.resume()
    }
    
    func getNewPage(completion: BeerDataCompletion?) {
        
        if self.dataArray.count == persistedPageIndex * beerPerPage {
            let nextPage: Int = persistedPageIndex + 1
            
            loadBeerData(page: nextPage) { [unowned self] (success) in
                if success {
                    UserDefaults.standard.set(nextPage, forKey: "persistedPageIndex")
                    self.persistedPageIndex = nextPage
                } else {
                    //재시도요청
                }
                
                if let completion = completion { completion(success) }
                
            }
        }
    }
    
    func reloadDatas() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error)
        }
        
        self.persistedPageIndex = 0
        UserDefaults.standard.set(0, forKey: "persistedPageIndex")
        
        self.lastPageItemCount = 0
        UserDefaults.standard.set(0, forKey: "lastPageItemCount")
        
        self.shouldRequestPageToServer = true
        UserDefaults.standard.set(true, forKey: "shouldRequestPageToServer")
        
    }
    
    func addToRealm<T: Object>(_ item: T) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print(error)
        }
    }
    
}

// MARK: - Realm Instance

let realm: Realm = {
    var instance: Realm!
    while instance == nil {
        do {
            instance = try Realm()
        } catch {
            print(error)
        }
    }
    return instance
}()

enum NetworkResponse: Int {
    case success = 200
    case fail = 400
}
