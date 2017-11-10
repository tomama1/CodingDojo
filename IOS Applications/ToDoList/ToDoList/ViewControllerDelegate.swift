//
//  ViewControllerDelegate.swift
//  ToDoList
//
//  Created by Anna on 11/10/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import Foundation

protocol ViewControllerDelegate: class{
    func submitButtonPressed(by controller: addItemViewController, with addedListItem: listitem)
}
