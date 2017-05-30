//
//  MyEventsDisplayTableViewController.swift
//  MyEventApp
//
//  Created by Nicole Zurita on 5/25/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit
import CoreData

class MyEventsDisplayTableViewController: UITableViewController, editEventDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var myevents = [EventItem]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.reloadData()
        fetchAllItems()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func editEvent(title: String, info: String, date: String, at: IndexPath) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myevents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = myevents[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
        let event = myevents[indexPath.row]
        managedObjectContext.delete(event)
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            print("\(error)")
        }
        myevents.remove(at: indexPath.row)
        tableView.reloadData()

    }
    
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
    
    func fetchAllItems()
    {
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EventItem")
        do
        {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.fetch(itemRequest)
            
            // downcast the results as an array of AwesomeEntity objects
            myevents = results as! [EventItem]
            
        }
        catch
        {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }
    }
    
    
}
