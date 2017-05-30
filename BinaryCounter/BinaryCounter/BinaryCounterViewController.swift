//
//  ViewController.swift
//  BinaryCounter
//
//  Created by Nicole Zurita on 5/17/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class BinaryCounterViewController: UITableViewController, CustomCellDelegate {

    @IBOutlet weak var totalLabel: UILabel!

    var nums = [pow(10,0), pow(10,1), pow(10,2), pow(10,3), pow(10,4), pow(10,5), pow(10,6), pow(10,7), pow(10,8), pow(10,9), pow(10,10), pow(10,11), pow(10,12), pow(10,13), pow(10,14), pow(10,15)]
    
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BinaryCounterCell") as! CustomCell
        
        cell.numberLabel.text = "\(nums[indexPath.row])"
        cell.delegate = self
        

        return cell
    }
    
    func totalChangedBy(value: Int) { 
        self.total += value
        totalLabel.text = "Total: \(self.total)"
    }
}

