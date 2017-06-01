//
//  SignUpViewController.swift
//  LoginSignUpPractice
//
//  Created by 박종찬 on 2017. 5. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit



class SignUpViewController: UIViewController, UITextFieldDelegate {

    private let unwindSegueID: String = "UnwindSegue"
    private let signUpFailedMessage: String = "똑바로 안하냐"
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var subTitleLabel: UILabel!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TextFieldDelegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 170.0), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1...300: //텍스트필드의 태그가 100씩 증가하게 설정하였음. 따라서 이 케이스로 firstResponder를 자동으로 넘길 수 있음.
            self.view.viewWithTag(textField.tag + 100)?.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            self.signUpRequest()
        }
        return true
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        
        self.signUpRequest()
    }
    
    // MARK: - SignUp
    
    func signUpRequest() {
        self.view.endEditing(true)
        if !(emailTextField.text?.isEmpty)! && !(nickNameTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! && passwordTextField.text! == passwordConfirmTextField.text! {
            
            UserDefaults.standard.set(emailTextField.text!, forKey: Authentification.email)
            UserDefaults.standard.set(nickNameTextField.text!, forKey: Authentification.nickName)
            UserDefaults.standard.set(passwordTextField.text!, forKey: Authentification.password)
            
            //            self.dismiss(animated: true, completion: nil)

            
            UserDefaults.standard.set(true, forKey: Authentification.auth)
            self.performSegue(withIdentifier: unwindSegueID, sender: self)
            
        } else {
            self.subTitleLabel.text = signUpFailedMessage
        }
    }

}
