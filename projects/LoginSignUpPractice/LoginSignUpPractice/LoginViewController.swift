//
//  LoginViewController.swift
//  LoginSignUpPractice
//
//  Created by 박종찬 on 2017. 5. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 160.0), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 100:
            self.view.viewWithTag(200)?.becomeFirstResponder()
        default:
            self.loginRequest()
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func loginButtonTouched(_ sender: UIButton) {
        self.loginRequest()
    }
    
    func loginRequest() {
        self.view.endEditing(true)
        if !(self.emailTextField.text?.isEmpty)! && !(self.passwordTextField.text?.isEmpty)! {
            if self.emailTextField.text! == UserDefaults.standard.string(forKey: Authentification.email) && self.passwordTextField.text! == UserDefaults.standard.string(forKey: Authentification.password) {
                //로그인됨
                print("로그인 성공")
                UserDefaults.standard.set(true, forKey: Authentification.authentificationBool)
                self.dismiss(animated: true, completion: nil)
            } else {
                print("실패")
                //안됨
            }
        }
    }
    
}
