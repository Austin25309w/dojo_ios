//
//  ViewController.swift
//  EventApp2
//
//  Created by Nicole Zurita on 5/26/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import UIKit
import CoreData

protocol addEventDelegate
{
    func didEditEvent(title: String, info: String, time: String, at: IndexPath)
}

class AddEditEventViewController: UIViewController {

    // MARK: Variables
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var infoTextField: UITextField!
    @IBOutlet weak var timeField: UIDatePicker!
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var allEvents = [Event]()
    var delegate: addEventDelegate?
    var eventToEdit: Event?
    var eventToEditIndexPath: IndexPath?
    
    // MARK: Helper Functions
    
    // format the date to show only HH:MM
    func dateToString(toDoDate: NSDate) -> String{
        let retrievedDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let myString = formatter.string(from: retrievedDate)
        let yourDate: Date? = formatter.date(from: myString)
        formatter.dateFormat = "HH:mm"
        let updatedString = formatter.string(from: yourDate!)
        return(updatedString)
    }
    
    
    // MARK: ViewDidLoad and Warnings
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up what goes in the delegate
        if eventToEdit != nil
        {
            titleTextField.text = eventToEdit?.title
            infoTextField.text = eventToEdit?.info
            var formattedtime = dateToString(toDoDate: timeField.date as NSDate)
            formattedtime = (eventToEdit?.time)!
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: SEGUES
    
    // prepare segue with necessary things
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let controller = segue.destination as! MyEventsTableViewController
        
    }
    
    // where "cancel" on the next page unwinds
    @IBAction func returnFromMyEventDisplayTableController(_ segue: UIStoryboardSegue)
    {
        titleTextField.text = ""
        infoTextField.text = ""
    }
    
    
    
    
    // MARK: BUTTON ACTIONS
    
    // what happens when "My Events" is pressed
    @IBAction func myEventsButtonPressed(_ sender: UIButton)
    {
        // show the next scene with all the events listed out
        print(timeField)
        performSegue(withIdentifier: "ShowMyEventsSegue", sender: nil)
    }
    
    
    // what happens when "Save Event" is pressed
    @IBAction func saveEventButtonPressed(_ sender: UIButton)
    {
        
        let FormattedTime = dateToString(toDoDate: timeField.date as NSDate)
        
        // this goes to the other controller where didEditEvent function is
        if eventToEdit != nil
        {
            delegate?.didEditEvent(title: titleTextField.text!, info: infoTextField.text!, time: FormattedTime, at: eventToEditIndexPath!)
        }
        
        else
        {
            // add a new event with information that was filled out in form
            let newEvent = Event(context: managedObjectContext)
            newEvent.title = titleTextField.text
            newEvent.info = infoTextField.text
            newEvent.time = FormattedTime
            print(newEvent)
            allEvents.append(newEvent)
        }
        
        // save to the context or throw an error if something goes wrong
        do
        {
            try managedObjectContext.save()
            
        }
        catch
        {
            print(error)
        }
    }
}

