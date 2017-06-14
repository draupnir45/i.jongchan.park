//
//  ViewController.swift
//  OneTwoHundredDiary
//
//  Created by 박종찬 on 2017. 6. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class OTMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: OTDiaryTableViewCell.nibName, bundle: Bundle.main), forCellReuseIdentifier: OTDiaryTableViewCell.reuseIdentifier)
        tableView.allowsSelection = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let month: OTMonth = OTMonth(rawValue: section+1)!
        
        return numberOfDay(withMonth: month)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OTDiaryTableViewCell = tableView.dequeueReusableCell(withIdentifier: OTDiaryTableViewCell.reuseIdentifier, for: indexPath) as! OTDiaryTableViewCell
        
        cell.dayLabel.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleOf(month: OTMonth.init(rawValue: section+1)!)
    }
}

