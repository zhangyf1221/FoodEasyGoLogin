//
//  ViewController.swift
//  Login
//
//  Created by xian he on 1/5/16.
//  Copyright © 2016 com.foodeasygo.dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // define text field variables
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    // define login button
    @IBAction func loginButton(sender: AnyObject) {
        
        let email: String = emailTextField.text!;
        let password: String = passwordTextField.text!;
        
        let storedEmail = NSUserDefaults.standardUserDefaults().stringForKey("email");
        let storedPass = NSUserDefaults.standardUserDefaults().stringForKey("password");
        
        
        // check empty, if not, show alert
        if (email.isEmpty || password.isEmpty) {
            displayAlert("All fields are required");
        }
        
        // ensure entered email is in correct email form
        if (!isValidEmail(email)) {
            displayAlert("Please enter a correct email")
        }

        // check email entered match record or not
        if (storedEmail == email) {
            // check password entered mathc record or not
            if (storedPass == password) {
                
               // tap action
                //self.performSegueWithIdentifier("login", sender: self);
            }
            else {
                displayAlert("Email and password don't match");
            }
        }
        else {
            displayAlert("Email not in our record");
        }
   }
    


    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
    
    // display alert
    func displayAlert(info: String) {
        let myAlert = UIAlertController(title: "Alert", message: info, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler:nil);
        
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

