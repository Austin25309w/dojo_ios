//
//  ViewController.swift
//  NorthEastSouthWest
//
//  Created by Nicole Zurita on 5/16/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //sender is returning Optional(one of the directions)
        let direction = sender as! String //unwrap the optional and make it a string
        let controller = segue.destination as! DirectionOuputViewController //segue.destination is just a UIViewController
        controller.direction = direction //setting direction that we set up in DirectOutput ViewController...just a string
    }
    
    @IBAction func directionButtonPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: "DirectionSegue", sender: sender.titleLabel?.text!)
    }
    
    @IBAction func unwindingThings(_ segue: UIStoryboardSegue)
    {
        
    }
    
}

