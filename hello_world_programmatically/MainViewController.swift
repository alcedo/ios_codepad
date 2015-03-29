//
//  MainViewController.swift
//  hello_world_programmatically
//
//  Created by Victor Liew on 3/29/15.
//  Copyright (c) 2015 Victor Liew. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    var textField: UITextField?
    var label: UILabel?
    var notifCenter: NSNotificationCenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        this creates the text field and sets the frame
        “CGRectMake” creates the frame with (x,y,width,height)
        where x and y are are pixel distances from the top left
        of the screen
        */
        self.textField = UITextField(frame: CGRectMake(CGFloat(10), CGFloat(30),
            CGFloat(300), CGFloat(130.3123123)))
        self.textField?.borderStyle = UITextBorderStyle.RoundedRect
        self.textField?.delegate = self
        
        self.view.addSubview(self.textField!)
        self.notifCenter = NSNotificationCenter.defaultCenter()
        
        self.notifCenter!.addObserver(self,
            selector: "textFieldDidChange:",
            name: UITextFieldTextDidChangeNotification,
            object: self.textField)
        
        self.label = UILabel(frame: CGRectMake(0, 0, 100, 20))
        self.label?.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin |
                                       UIViewAutoresizing.FlexibleLeftMargin
        
        self.label?.text = "Labe Text Goes Here"
        self.label?.sizeToFit()
        self.view.addSubview(self.label!)
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidChange(notif: NSNotification) {
        self.label?.text = self.textField?.text
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        //this tells the operating system to remove
        //the keyboard from the forefront
        textField.resignFirstResponder()
        //returns NO. Instead of adding a line break,
        //the text field resigns
        return false
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
