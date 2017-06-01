//
//  SelectViewController.swift
//  PokemonSelect
//
//  Created by 박종찬 on 2017. 5. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    var selectedBallNumber: Int?
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "선택"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ballTouched(_ sender: UIButton) {
        
        self.selectedBallNumber = sender.tag
        self.performSegue(withIdentifier: "SelectionSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController: PokemonViewController = segue.destination as! PokemonViewController
        destinationViewController.pokemonInt = self.selectedBallNumber
    }
    
    
    @IBAction func unwindToSelectionView(_ segue: UIStoryboardSegue) {
        let sourceViewController: PokemonViewController = segue.source as! PokemonViewController
        let pokemonInt: Int = sourceViewController.pokemonInt!
        
        switch pokemonInt {
        case 1:
            self.infoLabel.text = "이상해씨를 선택했습니다."
        case 4:
            self.infoLabel.text = "파이리를 선택했습니다."
        default:
            self.infoLabel.text = "꼬부기를 선택했습니다."
        }
        
        let btn1: UIButton = self.view.viewWithTag(1) as! UIButton
        let btn4: UIButton = self.view.viewWithTag(4) as! UIButton
        let btn7: UIButton = self.view.viewWithTag(7) as! UIButton
        
        btn1.isEnabled = false
        btn4.isEnabled = false
        btn7.isEnabled = false
        
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
