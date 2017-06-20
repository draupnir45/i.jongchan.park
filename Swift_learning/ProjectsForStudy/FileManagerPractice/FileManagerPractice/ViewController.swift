//
//  ViewController.swift
//  FileManagerPractice
//
//  Created by 박종찬 on 2017. 6. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let docPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let filePath: String = docPath + "/testDoc.json"
        
        if FileManager.default.fileExists(atPath: filePath) {
            if let dictionary = NSDictionary(contentsOfFile: filePath) as? [String:Any] {
                print(dictionary)
                
                let nsDict: NSDictionary = NSDictionary(dictionary: dictionary)
                nsDict.write(toFile: filePath, atomically: true)
                
            }
        }
        
        
        
        let dictionary: [String:String] = ["111":"222", "333":"444"]
        
        let nsDict: NSDictionary = NSDictionary(dictionary: dictionary)
        nsDict.write(toFile: filePath, atomically: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

