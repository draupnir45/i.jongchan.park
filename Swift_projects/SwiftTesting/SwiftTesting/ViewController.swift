//
//  ViewController.swift
//  SwiftTesting
//
//  Created by 박종찬 on 2017. 3. 26..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataArray : NSArray [String] = ["Hi", "My", "Name", "Is", "Swift!"]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseID", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }

}

