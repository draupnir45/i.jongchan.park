//
//  ControlsViewController.swift
//  UIComponentsPractice
//
//  Created by 박종찬 on 2017. 6. 19..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ControlsViewController: UIViewController {

    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        someButton.setTitle("보통 상태의 타이틀", for: UIControlState.normal)
        
        someButton.setTitle("선택된 상태의 타이틀", for: UIControlState.selected)
        
        someButton.setTitle("하이라이티드", for: UIControlState.highlighted)
        
        someButton.titleLabel?.text
        
        self.view.addSubview(someButton)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        self.sliderLabel.text = String(sender.value)
        
    }
    
    @IBAction func sliderTouchUpInsided(_ sender: UISlider) {
        
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        
        self.switchLabel.text = String(sender.isOn)
        
    }
    
    @IBAction func indicatorButtonTouched(_ sender: UIButton) {
        
        if !sender.isSelected {
            self.activityIndicator.startAnimating()
            sender.isSelected = true
        } else {
            self.activityIndicator.stopAnimating()
            sender.isSelected = false
        }
        print(sender.currentTitle!)
        
        
    }
}
