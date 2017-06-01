//
//  ViewController.swift
//  BaseBallGame
//
//  Created by 박종찬 on 2017. 5. 22..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstPitchingLabel: UILabel!
    @IBOutlet weak var secondPitchingLabel: UILabel!
    @IBOutlet weak var thirdPitchingLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    var labelArray: [UILabel] = []
    var pitchedArray: [Int] = []
    var answerArray: [Int] = []
    
    var strikeCount: Int = 0
    var ballCount: Int = 0
    var outCount: Int = 0
    var tryCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelArray = [firstPitchingLabel, secondPitchingLabel, thirdPitchingLabel]
        
        makeNewAnswers()
        
        self.goButton.layer.cornerRadius = 5
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func strikeZoneTouched(_ sender: UIButton) {
        if self.pitchedArray.count < 3 {
            self.pitchedArray.append(sender.tag)
            self.labelArray[self.pitchedArray.count-1].text = "\(sender.tag)"
        } else {
            self.resultLabel.text = "3개 모두 선택했습니다. 낙장불입!"
        }
    }

    @IBAction func goButtonTouched(_ sender: UIButton) {
        
        if self.answerArray.count < 3 {
            self.resultLabel.text = "숫자를 더 선택해 주세요!"
        } else if self.strikeCount == 3 {
            self.makeNewAnswers()
            self.reInitialize()
            self.tryCount = 0
            self.resultLabel.text = "숫자를 선택하고\n GO 버튼을 눌러주세요!"
            self.goButton.setTitle("GO!", for: .normal )
        } else {
            self.tryCount += 1
            self.calculateCounts()
            self.displayResult()
        }
    }
    
    func makeNewAnswers() {
        self.answerArray = []
        while answerArray.count < 3 {
            let randomInt:Int = Int(arc4random()) % 9 + 1
            if !self.answerArray.contains(randomInt) {
                self.answerArray.append(randomInt)
            }
        }
        print(answerArray)
    }
    
    func reInitialize() {
        for label in self.labelArray {
            label.text = ""
        }
        
        self.strikeCount = 0
        self.ballCount = 0
        self.outCount = 0
        self.pitchedArray = []
        
        
    }
    
    func calculateCounts() {
        for ballInt in pitchedArray {
            if !self.answerArray.contains(ballInt) {
                self.outCount += 1
            } else if self.answerArray.index(of: ballInt) == self.pitchedArray.index(of: ballInt) {
                self.strikeCount += 1
            } else {
                self.ballCount += 1
            }
        }
    }
    
    func displayResult() {
        if self.strikeCount == 3 {
            self.resultLabel.text = "\(self.tryCount)차 시도, \(self.strikeCount) STRIKES, 성공! \n 아래 버튼을 눌러 재시작하세요."
            self.goButton.setTitle("RESET", for: .normal )
            
        } else {
            self.resultLabel.text = "\(self.tryCount)차 시도\n\(self.strikeCount) STRIKES, \(self.ballCount) BALLS, \(self.outCount) OUT!"
            
            self.reInitialize()
        }
    }
    
}
