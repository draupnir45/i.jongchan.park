//
//  ViewController.swift
//  ClosureGrammarPractice
//
//  Created by 박종찬 on 2017. 6. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var historyArray: [[Int]] = []
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let evenCheck = { (someParam:Int) -> Bool in someParam % 2 == 0}
        
        print("24350는 짝수? \(evenCheck(24350))")

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateButtonTouched(_ sender: UIButton) {
        
        var lotto645NumberSet: Set<Int> = []
        
        while lotto645NumberSet.count < 6 {
            lotto645NumberSet.insert(Int(arc4random_uniform(UInt32(45))) + 1)
        }
        
        let sortedLotto645Numbers: [Int] = lotto645NumberSet.sorted(by: {(num1:Int, num2:Int) -> Bool in num1 < num2 })
        
        self.resultLabel.text = "\(sortedLotto645Numbers)"
        
        historyArray.append(sortedLotto645Numbers)
        
    }
    
    @IBAction func clearButtonTouched(_ sender: UIButton) {
        
        let alert: UIAlertController = UIAlertController.init(title: "Clearing Histories...", message: "Are you sure?", preferredStyle: .alert)
        
        
        let okAction: UIAlertAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: { [unowned self] (sender: UIAlertAction) in
            self.historyArray = []
            self.resultLabel.text = "Cleared"
        })
        alert.addAction(okAction)
        
        let cancelAction: UIAlertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {(sender: UIAlertAction) in print("캔슬!!")})
        alert.addAction(cancelAction)
        
        self.present(alert, animated: false, completion: { print("알러트 뜨다") })
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HistorySegue" {
            let vc:HistoryViewController = segue.destination as! HistoryViewController
            vc.dataArray = self.historyArray
        }
    }

}

