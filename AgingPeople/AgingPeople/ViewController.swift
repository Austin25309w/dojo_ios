//
//  ViewController.swift
//  agingPeople
//
//  Created by Nicole Zurita on 5/15/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var names = ["George", "Betty", "Fran", "Joe", "Helda", "Winifred", "Zed", "Sara", "Jeffy", "Abraham", "Anna", "Melinda"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

func randomAges() -> Int
{
    let randomNum = arc4random_uniform(96) + 5
    print(randomNum)
    return Int(randomNum)
}

extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let returnCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        returnCell.textLabel?.text = names[indexPath.row]
        returnCell.detailTextLabel?.text = String(randomAges())
        return returnCell
        
    }
    
}

