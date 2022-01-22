//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggHardness = ["Soft":1,"Medium":2,"Hard" :3]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Soft":
            print(eggHardness[sender.currentTitle!])
        case "Medium":
            print(eggHardness[sender.currentTitle!])
        case "Hard":
            print(eggHardness[sender.currentTitle!])
        default:
            print("Nothing Clicked.")
        }
    }
}
