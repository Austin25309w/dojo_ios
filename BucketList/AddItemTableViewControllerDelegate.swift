//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by Nicole Zurita on 5/15/17.
//  Copyright © 2017 Nicole Zurita. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate: class
{
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
