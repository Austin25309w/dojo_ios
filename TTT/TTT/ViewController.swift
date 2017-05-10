//
//  ViewController.swift
//  TTT
//
//  Created by Nicole Zurita on 5/10/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var buttonOneLabel: UIButton!
    @IBOutlet weak var buttonTwoLabel: UIButton!
    @IBOutlet weak var buttonThreeLabel: UIButton!
    @IBOutlet weak var buttonFourLabel: UIButton!
    @IBOutlet weak var buttonFiveLabel: UIButton!
    @IBOutlet weak var buttonSixLabel: UIButton!
    @IBOutlet weak var buttonSevenLabel: UIButton!
    @IBOutlet weak var buttonEightLabel: UIButton!
    @IBOutlet weak var buttonNineLabel: UIButton!
    
    var turn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        buttonOneLabel.backgroundColor = UIColor.gray
        buttonOneLabel.isEnabled = true
        buttonTwoLabel.backgroundColor = UIColor.gray
        buttonTwoLabel.isEnabled = true
        buttonThreeLabel.backgroundColor = UIColor.gray
        buttonThreeLabel.isEnabled = true
        buttonFourLabel.backgroundColor = UIColor.gray
        buttonFourLabel.isEnabled = true
        buttonFiveLabel.backgroundColor = UIColor.gray
        buttonFiveLabel.isEnabled = true
        buttonSixLabel.backgroundColor = UIColor.gray
        buttonSixLabel.isEnabled = true
        buttonSevenLabel.backgroundColor = UIColor.gray
        buttonSevenLabel.isEnabled = true
        buttonEightLabel.backgroundColor = UIColor.gray
        buttonEightLabel.isEnabled = true
        buttonNineLabel.backgroundColor = UIColor.gray
        buttonNineLabel.isEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func colorRGBtoColorString(rgbColor: String) -> String
    {
        var colorString: String = ""
        if rgbColor ==  "Optional(UIExtendedSRGBColorSpace 1 0 0 1)"{
            colorString = "Red"
        }
        else
        {
            colorString = "Blue"
        }
        return colorString
    }
    
    func checkGame(senderTag: Int)
    {
        let currentColor: String
        switch senderTag
        {
        case 1:
            currentColor = String(describing: buttonOneLabel.backgroundColor)
            if String(describing: buttonTwoLabel.backgroundColor) == currentColor && String(describing: buttonThreeLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFourLabel.backgroundColor) == currentColor && String(describing: buttonSevenLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFiveLabel.backgroundColor) == currentColor && String(describing: buttonNineLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            
        case 2:
            currentColor = String(describing: buttonTwoLabel.backgroundColor)
            if String(describing: buttonOneLabel.backgroundColor) == currentColor && String(describing: buttonThreeLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFiveLabel.backgroundColor) == currentColor && String(describing: buttonEightLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }

        case 3:
            currentColor = String(describing: buttonThreeLabel.backgroundColor)
            if String(describing: buttonTwoLabel.backgroundColor) == currentColor && String(describing: buttonOneLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonSixLabel.backgroundColor) == currentColor && String(describing: buttonNineLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFiveLabel.backgroundColor) == currentColor && String(describing: buttonSevenLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
        case 4:
            currentColor = String(describing: buttonFourLabel.backgroundColor)
            if String(describing: buttonOneLabel.backgroundColor) == currentColor && String(describing: buttonSevenLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFiveLabel.backgroundColor) == currentColor && String(describing: buttonSixLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
        case 5:
            currentColor = String(describing: buttonFiveLabel.backgroundColor)
            if String(describing: buttonTwoLabel.backgroundColor) == currentColor && String(describing: buttonEightLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFourLabel.backgroundColor) == currentColor && String(describing: buttonSixLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonThreeLabel.backgroundColor) == currentColor && String(describing: buttonSevenLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonOneLabel.backgroundColor) == currentColor && String(describing: buttonNineLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
        case 6:
            currentColor = String(describing: buttonSixLabel.backgroundColor)
            if String(describing: buttonThreeLabel.backgroundColor) == currentColor && String(describing: buttonNineLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFourLabel.backgroundColor) == currentColor && String(describing: buttonFiveLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }

        case 7:
            currentColor = String(describing: buttonSevenLabel.backgroundColor)
            if String(describing: buttonOneLabel.backgroundColor) == currentColor && String(describing: buttonFourLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFiveLabel.backgroundColor) == currentColor && String(describing: buttonThreeLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonEightLabel.backgroundColor) == currentColor && String(describing: buttonNineLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }

        case 8:
            currentColor = String(describing: buttonEightLabel.backgroundColor)
            if String(describing: buttonTwoLabel.backgroundColor) == currentColor && String(describing: buttonFiveLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonSevenLabel.backgroundColor) == currentColor && String(describing: buttonNineLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
 
        case 9:
            currentColor = String(describing: buttonNineLabel.backgroundColor)
            if String(describing: buttonThreeLabel.backgroundColor) == currentColor && String(describing: buttonSixLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonEightLabel.backgroundColor) == currentColor && String(describing: buttonSevenLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            else if String(describing: buttonFiveLabel.backgroundColor) == currentColor && String(describing: buttonOneLabel.backgroundColor) == currentColor
            {
                winnerLabel.isHidden = false
                let winningColor = colorRGBtoColorString(rgbColor: currentColor)
                winnerLabel.text = "\(winningColor) wins"
            }
            
        default:
            break
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        if turn == 0
        {
            switch sender.tag
            {
            case 1:
                buttonOneLabel.backgroundColor = UIColor.red
                buttonOneLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            case 2:
                buttonTwoLabel.backgroundColor = UIColor.red
                buttonTwoLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            case 3:
                buttonThreeLabel.backgroundColor = UIColor.red
                buttonThreeLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            case 4:
                buttonFourLabel.backgroundColor = UIColor.red
                buttonFourLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            case 5:
                buttonFiveLabel.backgroundColor = UIColor.red
                buttonFiveLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            case 6:
                buttonSixLabel.backgroundColor = UIColor.red
                buttonSixLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            case 7:
                buttonSevenLabel.backgroundColor = UIColor.red
                buttonSevenLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            case 8:
                buttonEightLabel.backgroundColor = UIColor.red
                buttonEightLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            case 10:
                viewDidLoad()
            default:
                buttonNineLabel.backgroundColor = UIColor.red
                buttonNineLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 1
            }
        }
        
        else
        {
            switch sender.tag
            {
            case 1:
                buttonOneLabel.backgroundColor = UIColor.blue
                buttonOneLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            case 2:
                buttonTwoLabel.backgroundColor = UIColor.blue
                buttonTwoLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            case 3:
                buttonThreeLabel.backgroundColor = UIColor.blue
                buttonThreeLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            case 4:
                buttonFourLabel.backgroundColor = UIColor.blue
                buttonFourLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            case 5:
                buttonFiveLabel.backgroundColor = UIColor.blue
                buttonFiveLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            case 6:
                buttonSixLabel.backgroundColor = UIColor.blue
                buttonSixLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            case 7:
                buttonSevenLabel.backgroundColor = UIColor.blue
                buttonSevenLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            case 8:
                buttonEightLabel.backgroundColor = UIColor.blue
                buttonEightLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            case 10:
                viewDidLoad()
            default:
                buttonNineLabel.backgroundColor = UIColor.blue
                buttonNineLabel.isEnabled = false
                checkGame(senderTag: sender.tag)
                turn = 0
            }
        }
        
    }

}

