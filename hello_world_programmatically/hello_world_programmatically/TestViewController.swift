//
//  TestViewController.swift
//  hello_world_programmatically
//
//  Created by Victor Liew on 3/30/15.
//  Copyright (c) 2015 Victor Liew. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITextFieldDelegate {
    var textField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Test View Controller"
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 2)
        
        self.textField = UITextField(frame: CGRectMake(CGFloat(0), CGFloat(0),
            CGFloat(300), CGFloat(130.3123123)))
        self.textField?.borderStyle = UITextBorderStyle.RoundedRect
        self.textField?.delegate = self
        
        self.view.addSubview(self.textField!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
