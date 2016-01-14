//
//  UserProfileViewController.swift
//  Login
//
//  Created by xian he on 1/13/16.
//  Copyright © 2016 com.foodeasygo.dev. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var objects: NSMutableArray! = NSMutableArray()
    var userInfo: NSMutableArray! = NSMutableArray()
    var userDetail: NSMutableArray! = NSMutableArray()
    
    let userAccount = NSUserDefaults.standardUserDefaults().stringForKey("email")
    let userPassword = NSUserDefaults.standardUserDefaults().stringForKey("password")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.objects.addObject("Account")
        self.objects.addObject("Password")
        
        self.userDetail.addObject("Address")
        self.userDetail.addObject("Phone")
        
        self.userInfo.addObject(userAccount!)
        self.userInfo.addObject(userPassword!)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
        //return 4;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == 1 {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        cell.textLabel?.text = objects[indexPath.row] as? String
        cell.detailTextLabel?.text = userInfo[indexPath.row] as? String
        
        return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell2")!
            cell.textLabel?.text = userDetail[indexPath.row] as? String
            cell.detailTextLabel?.text = userDetail[indexPath.row] as? String
            
            return cell
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
