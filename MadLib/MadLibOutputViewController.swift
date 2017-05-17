//
//  MadLibOutputViewController.swift
//  MadLib
//
//  Created by Nicole Zurita on 5/16/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class MadLibOutputViewController: UIViewController {
    
    var adjective: String?
    var firstVerb: String?
    var secondVerb: String?
    var noun: String?
    
    @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let theString = "We are having a perfectly " + adjective! + " time now. Later we will " +  firstVerb! + " and " + secondVerb! + " in the " + noun!
        backButton.setTitle(theString, for: .normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
