//
//  AddEventDelegate.swift
//  MyEventApp
//
//  Created by Nicole Zurita on 5/25/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import Foundation

protocol AddEventDelegate: class
{
    func itemSaved(by controller: MyEventViewController, with title: String, with info: String, with time: String, at indexPath: NSIndexPath?)
}
