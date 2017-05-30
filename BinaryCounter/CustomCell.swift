//
//  CustomCell.swift
//  BinaryCounter
//
//  Created by Nicole Zurita on 5/17/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

protocol CustomCellDelegate: class
{
    func totalChangedBy(value: Int)
}

class CustomCell: UITableViewCell
{
    
    weak var delegate: CustomCellDelegate?
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        var value = Int(numberLabel.text!)
        
        if sender.tag == 1
        {
            value = -value!
        }
        
        delegate?.totalChangedBy(value: value!)
    }

}
