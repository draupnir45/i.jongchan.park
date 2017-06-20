//
//  ViewController.swift
//  UIComponentsPractice
//
//  Created by 박종찬 on 2017. 6. 18..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController222: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.sliderLabel.text = String(sender.value)
    }
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        self.switchLabel.text = String(sender.isOn)
    }
    @IBAction func activityIndicatorButtonTouched(_ sender: UIButton) {
        if !sender.isSelected {
            self.activityIndicator.startAnimating()
            sender.isSelected = true
        } else {
            self.activityIndicator.stopAnimating()
            sender.isSelected = false
        }
    }
    

}

