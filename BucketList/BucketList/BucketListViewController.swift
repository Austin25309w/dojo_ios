//
//  ViewController.swift
//  BucketList
//
//  Created by Nicole Zurita on 5/15/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {

    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [BucketListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems() 
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].text!
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            print("\(error)")
        }
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "AddItemSegue"
        {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableController = navigationController.topViewController as! AddItemTableViewController
            addItemTableController.delegate = self
        }
        
        else if segue.identifier == "EditItemSegue"
        {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableController = navigationController.topViewController as! AddItemTableViewController
            addItemTableController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableController.itemToEdit = item.text!
            addItemTableController.indexPath = indexPath
        }
    }
    
    func fetchAllItems()
    {
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do
        {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.fetch(itemRequest)
            
            // downcast the results as an array of AwesomeEntity objects
            items = results as! [BucketListItem]
            
            // print the details of each item
//            for item in items {
//                print("\(item.text ?? "hi")")
//            }
         }
        catch
        {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        
        if let ip = indexPath
        {
            let item = items[ip.row]
            item.text = text
        }
        
        else
        {
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
            item.text = text
            items.append(item)
        }
        
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

