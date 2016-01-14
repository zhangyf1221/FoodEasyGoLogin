//
//  RegisterPage.swift
//  Login
//
//  Created by xian he on 1/5/16.
//  Copyright © 2016 com.foodeasygo.dev. All rights reserved.
//

import UIKit

class RegisterPage: UIViewController {

    // define text field variables
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    // define reguster button
    @IBAction func registerButton(sender: AnyObject) {
        
        let email: String = emailTextField.text!;
        let password: String = passwordTextField.text!;
        let confirmpass: String = confirmTextField.text!;
        
        let storedEmail = NSUserDefaults.standardUserDefaults().stringForKey("email");
        
        // check empty, if not, show alert
        if (email.isEmpty || password.isEmpty || confirmpass.isEmpty) {
            displayAlert("All fields are required", status: false);
        }
        
        // ensure entered email is in correct email form
        // TODO: use regular expression
        if (!isValidEmail(email)) {
            displayAlert("Please enter a correct email", status: false);
        }
        
        // check password and confirm password match to each other, if not, show alert
        if (password != confirmpass) {
            displayAlert("Passwords don't match", status: false);
        }
        
        // check email in record or not, avoid repeating registeration
        
        if (email == storedEmail) {
            displayAlert("This email has been registered", status: false);
        }
        
        
        // store data and show success information
        NSUserDefaults.standardUserDefaults().setObject(email, forKey: "email");
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        displayAlert("Registration is successful, please go to login page", status: true);
        
        // TODO: Jump back to login page after taped ok
        
        
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    // display alert if status is false or congratulation if true
    func displayAlert(info: String, status: Bool) {
        let myAlert = UIAlertController(title: "Alert", message: info, preferredStyle: UIAlertControllerStyle.Alert);
        
        let myCongra = UIAlertController(title:"Congratulation", message: info, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler:nil);
    
        if status {
            myCongra.addAction(okAction);
            self.presentViewController(myCongra, animated: true, completion: nil);
        }
        else {
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated: true, completion: nil);
        }
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
