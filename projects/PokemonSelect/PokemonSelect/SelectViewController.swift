//
//  SelectViewController.swift
//  PokemonSelect
//
//  Created by 박종찬 on 2017. 5. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    private let SelectionSegueID: String = "SelectionSegue"
    
    @IBOutlet weak var ballButton1: UIButton!
    @IBOutlet weak var ballButton2: UIButton!
    @IBOutlet weak var ballButton3: UIButton!
    
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
        self.performSegue(withIdentifier: SelectionSegueID, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController: PokemonViewController = segue.destination as! PokemonViewController
        destinationViewController.pokemonInt = self.selectedBallNumber
    }
    
    
    @IBAction func unwindToSelectionView(_ segue: UIStoryboardSegue) {
        let sourceViewController: PokemonViewController = segue.source as! PokemonViewController
        let pokemonInt: Int = sourceViewController.pokemonInt!
        
        let data: Dictionary = pokemonDataArray[pokemonInt]
        
        self.infoLabel.text = "\((data["name"] as! String))를 선택하였구나...!"
        
        ballButton1.isEnabled = false
        ballButton2.isEnabled = false
        ballButton3.isEnabled = false
        
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
