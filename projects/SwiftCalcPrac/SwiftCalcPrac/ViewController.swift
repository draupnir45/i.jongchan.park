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
//    case controls
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
    
    @IBOutlet weak var equalButton: ControlButton!
    
    
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
    
    
    @IBAction func allClear() {
        self.displayLabel.text = "0"
        previousKey  = nil
    }
    
    @IBAction func numbButtonTouched(_ sender: CalcButton) {
        if self.previousKey == nil {
            self.calcBufferArray.append(CalcBuffer(oper: CalcOperators.add, numb: sender.currentTitle!))
        } else {
            switch self.previousKey! {
            case CalcKeyType.operators:
                self.calcBufferArray.append(CalcBuffer(oper: self.operBuffer, numb: sender.currentTitle!))
            case CalcKeyType.numbers:
                var bufferToEdit: CalcBuffer = self.calcBufferArray.last!
                bufferToEdit.numb += sender.currentTitle!
            }
        }
        
        self.displayLabel.text = self.calcBufferArray.last!.numb
        self.previousKey = CalcKeyType.numbers
    }
    
    @IBAction func operatorButtonTouched(_ sender: OperatorButton) {
        
    }
    
    @IBAction func equalButtonTouched(_ sender: ControlButton) {
        
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
    var oper: CalcOperators?
}
class ControlButton: CalcButton {
    var controlType: CalcControls?
}
