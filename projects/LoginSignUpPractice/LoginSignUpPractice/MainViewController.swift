//
//  MainViewController.swift
//  LoginSignUpPractice
//
//  Created by 박종찬 on 2017. 5. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

//    var isAuthentified: Bool = UserDefaults.standard.bool(forKey: "Authentification")
    let loginSegueID: String = "LoginViewSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let isAuthentified: Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
        super.viewDidAppear(animated)
        if !isAuthentified {
            self.performSegue(withIdentifier: loginSegueID, sender: self)
        }
    }
    
    @IBAction func unwindToMain(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func logoutButtonTouched(_ sender: UIButton) {
        
        UserDefaults.standard.set(false, forKey: Authentification.authentificationBool)
        self.performSegue(withIdentifier: loginSegueID, sender: self)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
