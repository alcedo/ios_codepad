//
//  ViewController.swift
//  week2_assignment
//
//  Created by Victor Liew on 5/9/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Yelp"
        self.view.backgroundColor = UIColor.whiteColor()
        let filterButton = UIBarButtonItem(title: "Filters", style: .Plain, target: self, action: "didSelectFilterButton:")
        filterButton.tintColor = UIColor.whiteColor()
        
        self.navigationItem.leftBarButtonItem = filterButton
        
        self.setupView()
    }

    
    
    //MARK: Event and action handlers 
    func didSelectFilterButton(button: UIBarButtonItem){
        println("selected")
        
    }
    func setupView() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

