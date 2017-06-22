//
//  ViewController.swift
//  RandomStudentForIDS
//
//  Created by 박종찬 on 2017. 5. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    let students: [String] = ["강성찬", "김은영", "김태형", "박보영","박종훈","박찬욱","서현종","유하늘","윤새결","이재성 앞자리","이재성 뒷자리","이창호","임현정","정교윤","조선미","진승한","한동윤","함형수","황기수","황선유"]
    var previousIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func run(_ sender: Any) {
        var random: Int?
        repeat {
        random = Int(arc4random_uniform(UInt32(self.students.count)))
        } while (random! == previousIndex)
        
        self.displayLabel.text = "\(self.students[random!])님,\n 축하합니다!"
        self.previousIndex = random
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

