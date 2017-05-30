//
//  MyEventsTableViewController.swift
//  EventApp2
//
//  Created by Nicole Zurita on 5/26/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit
import CoreData

class MyEventsTableViewController: UITableViewController, addEventDelegate {

// MARK: Variables
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var allEvents = [Event]()
    
    
// MARK: Helper Functions
    
    // get all of the events stored in database
    func fetchAllItems()
    {
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Event")
        do
        {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.fetch(itemRequest)
            
            // downcast the results as an array of AwesomeEntity objects
            allEvents = results as! [Event]
            
        }
        catch
        {
            // print the error if it is caught
            print(error)
        }
    }
    
// MARK: VIEWDID-MEMORYWARNING
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! AddEditEventViewController
        controller.delegate = self
        
        //edit situation. indexPath is coming from line 93 where we are performing the segue to edit
        if let indexpath = sender as? IndexPath
        {
            // let's add event controller that eventToEdit is not null
            controller.eventToEdit = allEvents[indexpath.row]
            controller.eventToEditIndexPath = indexpath
        }

    }
    
    
// MARK: Actions
    
    // to satisfy the protocol and to set the new updated values in the event we want to edit
    func didEditEvent(title: String, info: String, time: String, at: IndexPath) {
        let eventToEdit = allEvents[at.row]
        eventToEdit.title = title
        eventToEdit.info = info
        eventToEdit.time = time
        
        tableView.reloadData()
        
        do
        {
            try managedObjectContext.save()
            
        }
        catch
        {
            print(error)
        }
        
    }
    
    
    // perform edit segue when the accessory button is clicked
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditEventSegue", sender: indexPath)
    }
    
    // what happens when complete button is clicked
    @IBAction func completeButtonPressed(_ sender: UIButton)
    {
        // this should have been implemented in the core data table but I didn't so....
        sender.backgroundColor = UIColor.green
    }
    
    // deleting with the detail disclosure
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
        let event = allEvents[indexPath.row]
        managedObjectContext.delete(event)
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            print(error)
        }
        allEvents.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
// MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {

        return allEvents.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        // using a custom cell class here so that label and button can be on the same cell without overcrowding
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        cell.eventTitle.text = allEvents[indexPath.row].time! + " -- " + allEvents[indexPath.row].title!
        cell.completeButton.backgroundColor = UIColor.red
        return cell
        
    }

}
