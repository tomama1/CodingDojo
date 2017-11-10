//
//  addItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by Anna on 11/7/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import Foundation

protocol addItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}

