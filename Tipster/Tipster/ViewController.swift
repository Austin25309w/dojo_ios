//
//  ViewController.swift
//  Tipster
//
//  Created by Nicole Zurita on 5/10/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var lowTipPercentLabel: UILabel!
    @IBOutlet weak var middleTipPercentLabel: UILabel!
    @IBOutlet weak var highTipPercentLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var groupSizeSlider: UISlider!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var lowTip: UILabel!
    @IBOutlet weak var middleTip: UILabel!
    @IBOutlet weak var highTip: UILabel!
    @IBOutlet weak var lowTipTotal: UILabel!
    @IBOutlet weak var middleTipTotal: UILabel!
    @IBOutlet weak var highTipTotal: UILabel!

    
    var clear: String = "0"
    var lowTipPercent = 5
    var middleTipPercent = 10
    var highTipPercent = 15
    var totalBeforeTip = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lowTipPercentLabel.text = String(lowTipPercent) + "%"
        middleTipPercentLabel.text = String(middleTipPercent) + "%"
        highTipPercentLabel.text = String(highTipPercent) + "%"
        groupSizeLabel.text = "1"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func groupSliderSlided(_ sender: UISlider)
    {
        groupSizeLabel.text = String(Int(sender.value))
    }
    
    @IBAction func tipSliderSlided(_ sender: UISlider)
    {
        let groupSize = Double(groupSizeLabel.text!) ?? 1
        let lowTipAmount = (Double(totalBeforeTip) ?? 0)*(Double(Int(sender.value + 5))/100)
        let middleTipAmount = (Double(totalBeforeTip) ?? 0)*(Double(Int(sender.value + 10))/100)
        let highTipAmount = (Double(totalBeforeTip) ?? 0)*(Double(Int(sender.value + 15))/100)
        
        lowTipPercentLabel.text = String(Int(sender.value + 5)) + "%"
        lowTip.text = String(lowTipAmount/groupSize)
        if Double(totalBeforeTip) ?? 0 > 0
        {
            let lowTipTotalHelper = (lowTipAmount) + Double(totalBeforeTip)!
            lowTipTotal.text = String(lowTipTotalHelper)
        }
        middleTipPercentLabel.text = String(Int(sender.value + 10)) + "%"
        middleTip.text = String(middleTipAmount/groupSize)
        if Double(totalBeforeTip) ?? 0 > 0
        {
            let middleTipTotalHelper = (middleTipAmount) + Double(totalBeforeTip)!
            middleTipTotal.text = String(middleTipTotalHelper)
        }
        highTipPercentLabel.text = String(Int(sender.value + 15)) + "%"
        highTip.text = String(highTipAmount/groupSize)
        if Double(totalBeforeTip) ?? 0 > 0
        {
            let highTipTotalHelper = (highTipAmount) + Double(totalBeforeTip)!
            highTipTotal.text = String(highTipTotalHelper)
        }
    }
    

    @IBAction func numberPressed(_ sender: UIButton)
    {
        print(sender.tag)
        
        if sender.tag == 10
        {
            clear = "0"
            totalBeforeTip = ""
            decimalButton.isEnabled = true
            totalLabel.text = String(clear)
            lowTip.text = "0"
            middleTip.text = "0"
            highTip.text = "0"
            lowTipTotal.text = "0"
            middleTipTotal.text = "0"
            highTipTotal.text = "0"
        }
        
        else if sender.tag == 11
        {
            totalBeforeTip += "."
            totalLabel.text = String(totalBeforeTip)
            decimalButton.isEnabled = false
        }
        
        else
        {
            totalBeforeTip += String(sender.tag)
            totalLabel.text = String(totalBeforeTip)
        }
    }
}

