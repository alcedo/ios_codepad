//
//  MainViewController.swift
//  hello_world_programmatically
//
//  Created by Victor Liew on 3/29/15.
//  Copyright (c) 2015 Victor Liew. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var textField: UITextField?
    var label: UILabel?
    
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
        
        self.view.addSubview(self.textField!)

        // Do any additional setup after loading the view.
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
