//
//  PokemonViewController.swift
//  PokemonSelect
//
//  Created by 박종찬 on 2017. 5. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    
    var pokemonInt: Int?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data: Dictionary = pokemonDataArray[pokemonInt!]
        self.title = (data["name"] as! String)
        self.imageView.image = (data["image"] as! UIImage)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
