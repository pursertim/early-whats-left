//
//  DetailViewController.swift
//  whatsleftapp
//
//  Created by Tim Purser on 14/04/2015.
//  Copyright (c) 2015 Tim Purser. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    // Container to store the view table selected object
    var currentObject : PFObject?
    
    // Some text fields
    @IBOutlet weak var recipe: UITextField!
    @IBOutlet weak var Ingredient: UITextField!
    @IBOutlet weak var ingredient2: UITextField!
    @IBOutlet weak var ingredient3: UITextField!
    @IBOutlet weak var ingredient4: UITextField!
    @IBOutlet weak var ingredient5: UITextField!
    @IBOutlet weak var method: UITextView!
    
    
    // The save button
    @IBAction func saveButton(sender: AnyObject) {
        
        if let updateObject = currentObject as PFObject? {
            
            // Update the existing parse object
            updateObject["recipe"] = recipe.text
            updateObject["Ingredient"] = Ingredient.text
            updateObject["ingredient2"] = ingredient2.text
            updateObject["ingredient3"] = ingredient3.text
            updateObject["ingredient4"] = ingredient4.text
            updateObject["ingredient5"] = ingredient5.text
            updateObject["method"] = method.text
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
            
        } else {
            
            // Create a new parse object
            var updateObject = PFObject(className:"Recipe")
            
            updateObject["recipe"] = recipe.text
            updateObject["Ingredient"] = Ingredient.text
            updateObject["ingredient2"] = ingredient2.text
            updateObject["ingredient3"] = ingredient3.text
            updateObject["ingredient4"] = ingredient4.text
            updateObject["ingredient5"] = ingredient5.text
            updateObject["method"] = method.text
            updateObject.ACL = PFACL(user: PFUser.currentUser())
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
            
        }
        
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Unwrap the current object object
        if let object = currentObject {
            recipe.text = object["recipe"] as! String
            Ingredient.text = object["Ingredient"] as! String
            ingredient2.text = object["ingredient2"] as! String
            ingredient3.text = object["ingredient3"] as! String
            ingredient4.text = object["ingredient4"] as! String
            ingredient5.text = object["ingredient5"] as! String
            method.text = object["method"] as! String
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
	