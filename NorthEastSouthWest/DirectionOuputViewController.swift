//
//  DirectionOuputViewController.swift
//  NorthEastSouthWest
//
//  Created by Nicole Zurita on 5/16/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class DirectionOuputViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    var direction: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.setTitle(direction, for: .normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
