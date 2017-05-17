//
//  ViewController.swift
//  SwiftCalcPrac
//
//  Created by 박종찬 on 2017. 5. 11..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

enum CalcOperators {
    case add
    case minus
    case multiply
    case divide
}

enum CalcControls {
    case clear
    case toggleSign
    case percentage
    case equal
}

enum CalcKeyType {
    case numbers
    case operators
}

class ViewController: UIViewController {
    
    struct CalcBuffer {
        var oper: CalcOperators
        var numb: String
    }


    @IBOutlet weak var displayLabel: UILabel!
    var calcBufferArray: [CalcBuffer] = []
    var operBuffer: CalcOperators = CalcOperators.add
    var previousKey: CalcKeyType? = nil
    
    @IBOutlet weak var divideButton: OperatorButton!
    @IBOutlet weak var multiplButton: OperatorButton!
    @IBOutlet weak var minusButton: OperatorButton!
    @IBOutlet weak var addButton: OperatorButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.divideButton.oper = CalcOperators.divide
        self.multiplButton.oper = CalcOperators.multiply
        self.minusButton.oper = CalcOperators.minus
        self.addButton.oper = CalcOperators.add
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func calculate(with calcOperator: CalcOperators, number numb1:Double, and numb2:Double) -> Double {
        switch calcOperator {
        case CalcOperators.add:
            return numb1 + numb2
        case CalcOperators.minus:
            return numb1 - numb2
        case CalcOperators.multiply:
            return numb1 * numb2
        case CalcOperators.divide:
            return numb1 / numb2
        }
    }

    func formatedString(with result: Double) -> String {
        let flooredResult: Double = floor(result)
        if (flooredResult == result) {
            return String(format: "%.0f", flooredResult)
        } else {
            return String(result)
        }
        
    }
    
    func addNewCalcBuffer(with operation: CalcOperators, andNumberString number: String) {
        self.calcBufferArray.append(CalcBuffer(oper: operation, numb: number))
    }
    
    func calculateCalcBuffer(with index: Int) {
        let calcBufferToOperate: CalcBuffer = self.calcBufferArray[index]
        let previousCalcBuffer: CalcBuffer =  self.calcBufferArray[index-1]
        let number1: Double = Double(previousCalcBuffer.numb)!
        let number2: Double = Double(calcBufferToOperate.numb)!
        
        var resultNumber: Double = 0.0
        switch calcBufferToOperate.oper {
        case CalcOperators.add:
            resultNumber = number1 + number2
        case CalcOperators.minus:
            resultNumber = number1 - number2
        case CalcOperators.multiply:
            resultNumber = number1 * number2
        case CalcOperators.divide:
            resultNumber = number1 / number2
        
        }
        
        self.calcBufferArray[index-1].numb = formatedString(with: resultNumber)
        self.calcBufferArray.remove(at: index)
        
    }
    
    func deselectOperationButtons() -> Void {
        self.divideButton.isSelected = false
        self.multiplButton.isSelected = false
        self.minusButton.isSelected = false
        self.addButton.isSelected = false
    }
    
    func updateDisplayLabel() {
        self.displayLabel.text = self.calcBufferArray.last!.numb
    }
    
    
    @IBAction func allClear() {
        self.displayLabel.text =    "0"
        self.operBuffer =           CalcOperators.add
        self.calcBufferArray =      []
        self.previousKey =          nil
        self.deselectOperationButtons()
    }
    
    @IBAction func changeSignButtonTouched(_ sender: CalcButton) {
        
        var numb: Double = Double(self.calcBufferArray.last!.numb)!
        numb *= -1.0
        self.calcBufferArray[calcBufferArray.endIndex-1].numb = formatedString(with: numb)
        self.updateDisplayLabel()
        
    }
    
    @IBAction func percentize(_ sender: CalcButton) {
        
        var numb: Double = Double(self.calcBufferArray.last!.numb)!
        numb *= 0.01
        self.calcBufferArray[calcBufferArray.endIndex-1].numb = formatedString(with: numb)
        updateDisplayLabel()
        
    }
    
    
    @IBAction func numbButtonTouched(_ sender: CalcButton) {
        if self.previousKey == nil {
            if sender.currentTitle == "." {
                addNewCalcBuffer(with: .add, andNumberString: "0.")
            } else {
                addNewCalcBuffer(with: .add, andNumberString: sender.currentTitle!)
            }
        } else {
            switch self.previousKey! {
            case CalcKeyType.operators:
                self.calcBufferArray[calcBufferArray.endIndex-1].numb = sender.currentTitle!
            case CalcKeyType.numbers:
                
                if self.displayLabel.text == "0" {
                    if sender.currentTitle == "." {
                        addNewCalcBuffer(with: .add, andNumberString: "0.")
                    } else if sender.currentTitle != "0" {
                        addNewCalcBuffer(with: .add, andNumberString: sender.currentTitle!)
                    }
                } else {
                var bufferToEdit: CalcBuffer = self.calcBufferArray.last!
                bufferToEdit.numb += sender.currentTitle!
                self.calcBufferArray.removeLast()
                self.calcBufferArray.append(bufferToEdit)
                }
            }

        }
        
        updateDisplayLabel()
        self.previousKey = CalcKeyType.numbers
    }
    
    @IBAction func operatorButtonTouched(_ sender: OperatorButton) {
        
        if self.previousKey == nil {
            self.operBuffer = sender.oper
        } else {
            switch self.previousKey! {
            case CalcKeyType.operators:
                self.operBuffer = sender.oper
            case CalcKeyType.numbers:
                
                switch sender.oper {
                case CalcOperators.multiply, CalcOperators.divide:
                    if self.calcBufferArray.count > 1 {
                        if (self.calcBufferArray.last!.oper == CalcOperators.multiply || self.calcBufferArray.last!.oper == CalcOperators.multiply) {
                            
                            calculateCalcBuffer(with: self.calcBufferArray.endIndex-1)
                            updateDisplayLabel()
                            //앞 버퍼의 연산자가 우선일 경우... 연산 후 버퍼에 넣고 결과값 디스플레이
                        }
                    }
                case CalcOperators.add, CalcOperators.minus:
                    while self.calcBufferArray.count > 1 {
                        calculateCalcBuffer(with: self.calcBufferArray.endIndex-1)
                    }
                    updateDisplayLabel()
                    //무조건 모든 버퍼 연산 후 디스플레이
                }
                
                self.operBuffer = sender.oper
                
                addNewCalcBuffer(with: self.operBuffer, andNumberString: "")
            }
        }
        
        deselectOperationButtons()
        sender.isSelected = true
        self.previousKey = CalcKeyType.operators
    }
    
    @IBAction func equalButtonTouched(_ sender: CalcButton) {
        while self.calcBufferArray.count > 1 {
            calculateCalcBuffer(with: self.calcBufferArray.endIndex-1)
        }
        deselectOperationButtons()
        updateDisplayLabel()
    }
    
}

class CalcButton: UIButton {
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? backgroundColor?.withAlphaComponent(0.8) : backgroundColor?.withAlphaComponent(1.0)
        }
    }
}

class OperatorButton: CalcButton {
    var oper: CalcOperators = CalcOperators.add //옵셔널로 하는 대신 기본값 설정.
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    override open var isSelected: Bool {
        didSet {
            self.layer.borderWidth = isSelected ? 1 : 0
        }
    }
    
}
