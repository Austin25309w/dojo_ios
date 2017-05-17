//
//  ViewController.swift
//  MadLib
//
//  Created by Nicole Zurita on 5/16/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var firstVerbTextField: UITextField!
    @IBOutlet weak var secondVerbTextField: UITextField!
    @IBOutlet weak var nounTextField: UITextField!

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
        //instance of other ViewController
        let controller = segue.destination as! MadLibOutputViewController
        controller.adjective = adjectiveTextField.text
        controller.firstVerb = firstVerbTextField.text
        controller.secondVerb = secondVerbTextField.text
        controller.noun = nounTextField.text
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: "submitSegue", sender: sender.titleLabel?.text)
    }
    
    
    @IBAction func unwindingThings(_ segue: UIStoryboardSegue)
    {
        adjectiveTextField.text = ""
        firstVerbTextField.text = ""
        secondVerbTextField.text = ""
        nounTextField.text = ""
    }

}

