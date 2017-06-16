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
    
    lazy var responderToken: Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: OTDiaryTableViewCell.nibName, bundle: Bundle.main), forCellReuseIdentifier: OTDiaryTableViewCell.reuseIdentifier)
        tableView.allowsSelection = false
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.todayIndexPath = self.indexPath(for: Date())
        
        self.tableView.scrollToRow(at: todayIndexPath, at: UITableViewScrollPosition.top, animated: true)
    }
    
    func indexPath(for date: Date) -> IndexPath {
        let calendar: Calendar = Calendar.current
        let month: Int = calendar.component(.month, from: date)
        let day: Int = calendar.component(.day, from: date)
        
        return IndexPath(row: day-1, section: month-1)
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OTMonth(rawValue: section+1)!.numberOfDay()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OTDiaryTableViewCell = tableView.dequeueReusableCell(withIdentifier: OTDiaryTableViewCell.reuseIdentifier, for: indexPath) as! OTDiaryTableViewCell
        
        cell.dayLabel.text = "\(indexPath.row + 1)"
        cell.textView.indexPath = indexPath
        
        let dictionary: [String:Any] = OTDataCenter.sharedInstance.dataArray[indexPath.section]
        var array:[String] = dictionary[DataKeys.dayArrayKey] as! [String]
        cell.textView.text = array[indexPath.row]
        cell.textView.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(OTDiaryTableViewCell.height)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return OTMonth(rawValue: section+1)!.getTitle()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if responderToken && indexPath == todayIndexPath {
            let todayCell: OTDiaryTableViewCell = cell as! OTDiaryTableViewCell
            todayCell.textView.becomeFirstResponder()
            responderToken = false
        }
    }
    
    //MARK: - TextView
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        let editingTextView: OTTextView = textView as! OTTextView
        
        //받아오기
        var dayArray:[String] = OTDataCenter.sharedInstance.dataArray[(editingTextView.indexPath?.section)!][DataKeys.dayArrayKey] as! [String]
        
        //최신화
        dayArray[(editingTextView.indexPath?.row)!] = textView.text
        
        //반영
        OTDataCenter.sharedInstance.dataArray[(self.editingIndexPath?.section)!][DataKeys.dayArrayKey] = dayArray
        
//        #warning
        //이게 최선...?
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = (textView.text?.characters.count)! + text.characters.count - range.length
        return !(newLength > 200)
    }
    
}

