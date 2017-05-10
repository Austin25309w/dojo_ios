//
//  ViewController.swift
//  NinjaGold
//
//  Created by Nicole Zurita on 5/9/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buildingButtonPressed(_ sender: UIButton)
    {
        if sender.tag == 1
        {
            farmLabel.isHidden = false
            caveLabel.isHidden = true
            houseLabel.isHidden = true
            casinoLabel.isHidden = true
            let potentialFarmScore = arc4random_uniform(11) + 10
            farmLabel.text = "You earned \(potentialFarmScore) points"
            score += Int(potentialFarmScore)
            scoreLabel.text = String(score)
        }
        
        else if sender.tag == 2
        {
            caveLabel.isHidden = false
            farmLabel.isHidden = true
            houseLabel.isHidden = true
            casinoLabel.isHidden = true
            let potentialCaveScore = arc4random_uniform(6) + 5
            caveLabel.text = "You earned \(potentialCaveScore) points"
            score += Int(potentialCaveScore)
            scoreLabel.text = String(score)
        }
        
        else if sender.tag == 3
        {
            houseLabel.isHidden = false
            caveLabel.isHidden = true
            farmLabel.isHidden = true
            casinoLabel.isHidden = true
            let potentialHouseScore = arc4random_uniform(4) + 2
            houseLabel.text = "You earned \(potentialHouseScore) points"
            score += Int(potentialHouseScore)
            scoreLabel.text = String(score)
        }
        
        else if sender.tag == 4
        {
            casinoLabel.isHidden = false
            caveLabel.isHidden = true
            houseLabel.isHidden = true
            farmLabel.isHidden = true
            let potentialCasinoScore = Int(arc4random_uniform(101)) - 50
            casinoLabel.text = "You earned \(potentialCasinoScore) points"
            score += potentialCasinoScore
            scoreLabel.text = String(score)
        }
        
        else
        {
            casinoLabel.isHidden = true
            caveLabel.isHidden = true
            houseLabel.isHidden = true
            farmLabel.isHidden = true
            score = 0
            scoreLabel.text = String(score)
        }
    }
    
    

}

