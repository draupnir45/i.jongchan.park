//
//  ViewController.swift
//  TestingConverter
//
//  Created by 박종찬 on 2017. 3. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: PokemonTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "reuseId")
        if cell == nil {
            cell = PokemonTableViewCell(style: .default, reuseIdentifier: "reuseId")
        }
        //셀 기본설정
        cell?.tintColor = self.view.tintColor
        cell?.accessoryType = .disclosureIndicator
        //셀 데이터
        cell?.numberLabel?.text = "NO.\(String(format: "%03ld", indexPath.row + 1))"
        cell?.textLabel?.text = self.sharedData.pokemonName[indexPath.row]
        cell?.imageView?.image = UIImage(named: "Thumbnails/thumbnail_\(indexPath.row + 1).png")
        return cell!
    }


}

