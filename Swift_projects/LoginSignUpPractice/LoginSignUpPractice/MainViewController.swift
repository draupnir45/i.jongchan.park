//
//  MainViewController.swift
//  LoginSignUpPractice
//
//  Created by 박종찬 on 2017. 5. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

let loginSegueID: String = "LoginViewSegue"

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isAuthentified: Bool = UserDefaults.standard.bool(forKey: Authentification.auth)
        if !isAuthentified {
            self.performSegue(withIdentifier: loginSegueID, sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - IBActions
    
    @IBAction func unwindToMain(_ segue: UIStoryboardSegue) { }
    
    @IBAction func logoutButtonTouched(_ sender: UIButton) {
        
        UserDefaults.standard.set(false, forKey: Authentification.auth)
        self.performSegue(withIdentifier: loginSegueID, sender: self)
        
    }

}
