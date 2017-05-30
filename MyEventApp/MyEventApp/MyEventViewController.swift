//
//  ViewController.swift
//  MyEventApp
//
//  Created by Nicole Zurita on 5/23/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//
import Foundation
import UIKit
import CoreData


protocol editEventDelegate {
    func editEvent(title: String, info: String, date: String, at: IndexPath)
}

class MyEventViewController: UIViewController
{
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var infoTextField: UITextField!
    @IBOutlet weak var time: UIDatePicker!
    var delegate: editEventDelegate?
    var indexPath: IndexPath?
    var eventToEdit: EventItem?
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var events = [EventItem]()
    
//    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init]
//    [outputFormatter setDateFormat:@"h:mm a"]
//    
//    self.myLabel.text = [outputFormatter stringFromDate:self.myDatePicker.date]
//    
//    [outputFormatter release]
    
    func dateToString(toDoDate: NSDate) -> String{
        let retrievedDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: retrievedDate)
        let yourDate: Date? = formatter.date(from: myString)
        formatter.dateFormat = "MM-dd-yyyy"
        let updatedString = formatter.string(from: yourDate!)
        return(updatedString)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let navController = segue.destination as! UINavigationController
        let controller = navController.topViewController as! MyEventsDisplayTableViewController
        controller.myevents = events
    }

    @IBAction func myEventsButtonPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: "myEventsSegue", sender: sender.titleLabel?.text)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton)
    {
        
        let time = dateToString(toDoDate: self.time.date as NSDate)
        
        if eventToEdit != nil
        {
            delegate?.editEvent(title: titleTextField.text!, info: infoTextField.text!, date: time, at: indexPath!)
        }
        else
        {
            var newEvent = EventItem(context: managedObjectContext)
            newEvent.title = titleTextField.text
            newEvent.info = infoTextField.text
            newEvent.time = time
            
            events.append(newEvent)
        }
        print(events[0])
        do
        {
            try managedObjectContext.save()
            print("i saved (theoretically)")
        }
        catch
        {
            
            print(error)
            print("the error ^")
        }
    }
    
    @IBAction func returnFromMyEventDisplayTableController(_ segue: UIStoryboardSegue)
    {
        titleTextField.text = ""
        infoTextField.text = ""
    }
    
}

