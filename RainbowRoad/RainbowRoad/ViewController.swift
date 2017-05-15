//
//  ViewController.swift
//  RainbowRoad
//
//  Created by Nicole Zurita on 5/15/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.rowHeight = 110.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let returnCell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        
        switch indexPath.row {
        case 1:
            returnCell.backgroundColor = UIColor.orange
        case 2:
            returnCell.backgroundColor = UIColor.yellow
        case 3:
            returnCell.backgroundColor = UIColor.green
        case 4:
            returnCell.backgroundColor = UIColor.blue
        case 5:
            returnCell.backgroundColor = UIColor.purple
        default:
            returnCell.backgroundColor = UIColor.red
        }
        return returnCell
    }
    
    
}

