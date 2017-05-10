//
//  ViewController.swift
//  ColdCall
//
//  Created by Nicole Zurita on 5/9/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    let names = [
        "Courtney",
        "Steve",
        "Jason",
        "Makayla",
        "Nicole",
        "Dan",
        "Jamie",
        "Laura",
        "Shannon",
        "Jeff",
        "James",
        "Pearl",
        "Michelle",
        "Joshua",
        "Tracy",
        "Caleb",
        "Kim"
    ]
    
    var current = 0
    
    @IBAction func coldCallPressed(_ sender: UIButton)
    {

        current = Int(arc4random_uniform(UInt32(names.count)))
        // if currentQuestion is less than the count of quizBank - 1 then currentQuestion++
        if current < names.count-1
        {
            current += 1
        }
            
            // else set currentQuestion to 0
        else
        {
            current = 0
        }
        updateUI()
    }
    
    func updateUI()
    {
        nameLabel.text = names[current]
        let randomNumberBetween1And5 = Int(arc4random_uniform(5)+1)
        if randomNumberBetween1And5 == 1 || randomNumberBetween1And5 == 2
        {
            numberLabel.textColor = UIColor.red
            numberLabel.text = String(randomNumberBetween1And5)
        }
        
        else if randomNumberBetween1And5 == 3 || randomNumberBetween1And5 == 4
        {
            numberLabel.textColor = UIColor.orange
            numberLabel.text = String(randomNumberBetween1And5)
        }
        
        else
        {
            numberLabel.textColor = UIColor.green
            numberLabel.text = String(randomNumberBetween1And5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

