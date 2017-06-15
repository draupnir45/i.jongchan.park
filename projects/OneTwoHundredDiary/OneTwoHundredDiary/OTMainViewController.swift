//
//  ViewController.swift
//  OneTwoHundredDiary
//
//  Created by 박종찬 on 2017. 6. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class OTMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var editingIndexPath: IndexPath?
    var todayIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: OTDiaryTableViewCell.nibName, bundle: Bundle.main), forCellReuseIdentifier: OTDiaryTableViewCell.reuseIdentifier)
        tableView.allowsSelection = false
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        getTodayIndexPath()
        self.tableView.scrollToRow(at: todayIndexPath, at: UITableViewScrollPosition.top, animated: true)
        
        //        let cell: OTDiaryTableViewCell = self.tableView.cellForRow(at: todayIndexPath) as! OTDiaryTableViewCell
        //
        //        cell.textView.becomeFirstResponder()
        //
        //        self.tableView.setContentOffset(CGPoint(x: 0.0, y: Double(dayCount - 1) * OTDiaryTableViewCell.height - (25.0 * Double(month))), animated: true)
    }
    
    func getTodayIndexPath() {
        let date = Date()
        let calendar = Calendar.current
        
        let month = calendar.component(.month, from: date)
        let day: Int = calendar.component(.day, from: date)
        
        todayIndexPath = IndexPath(row: day-1, section: month-1)
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
        cell.indexPath = indexPath
        
        let dictionary: [String:Any] = OTDataCenter.sharedInstance.dataArray[indexPath.section]
        var array:[String] = dictionary[DataKeys.dayArrayKey] as! [String]
        cell.textView.text = array[indexPath.row]
        
        if cell.textView.delegate == nil {
            cell.textView.delegate = self
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(OTDiaryTableViewCell.height)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleOf(month: OTMonth.init(rawValue: section+1)!)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let cell = textView.superview?.superview as! OTDiaryTableViewCell
        self.editingIndexPath = cell.indexPath
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        var dictionary: [String:Any] = OTDataCenter.sharedInstance.dataArray[(self.editingIndexPath?.section)!]
        var array:[String] = dictionary[DataKeys.dayArrayKey] as! [String]
        array[(editingIndexPath?.row)!] = textView.text
        dictionary[DataKeys.dayArrayKey] = array
        OTDataCenter.sharedInstance.dataArray[(self.editingIndexPath?.section)!] = dictionary
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = (textView.text?.characters.count)! + text.characters.count - range.length
        return !(newLength > 200)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath == todayIndexPath {
            let todayCell: OTDiaryTableViewCell = cell as! OTDiaryTableViewCell
            todayCell.textView.becomeFirstResponder()
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }

}

