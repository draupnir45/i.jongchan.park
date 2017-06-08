//
//  ViewController.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 6. 1..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.attributedText = attributedString(withString: "아이폰(영어: iPhone)은 2007년 1월 9일, 애플이 발표한 휴대 전화 시리즈이다. 미국 샌프란시스코에서 열린 맥월드 2007에서 애플의 창업자 중 한명인 스티브 잡스가 발표했다. \n 두번째 문단", lineSpacing: 17.0, paragraphSpacing: 50.0)
        
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        alertPack.presentAlert(withTitle: "풀버전 테스트", message: defaultDateStringPack.string(withDate: Date()), sender: self, okTitle: "오케이!", okHandler: { (action) in
//print("오케이합니다!")
//        }, cancelTitle: "아냐아냐", cancelHandler: { (action) in
//            print("아니래")
//        }) { 
//            print("프레젠트컴플리션!")
//        }
        
        alertPack.presentSimpleInfoAlert(withTitle: "제목", message: "나나나", sender: self)
        
    }


}

