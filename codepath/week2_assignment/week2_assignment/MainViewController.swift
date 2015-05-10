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
//        UIImage *buttonImage = [UIImage imageNamed:@"back.png"];
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setImage:buttonImage forState:UIControlStateNormal];
//        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
//        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        
//        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//        self.navigationItem.leftBarButtonItem = customBarItem;
//        [customBarItem release];
        
        let filterButton = UIBarButtonItem(title: "Filters", style: UIBarButtonItemStyle.Done, target: self, action: "didSelectFilterButton:")
        filterButton.tintColor = UIColor.whiteColor()
        
        self.navigationItem.leftBarButtonItem = filterButton
        let v =  UIView(frame: CGRectMake(0, 0, 30, 30))
        v.backgroundColor = UIColor.whiteColor()
        
        let g = UITapGestureRecognizer(target: self, action: "didSelectFilterButton2:")
        v.addGestureRecognizer(g)
        self.navigationItem.titleView = v
        
        self.setupView()
    }

    
    
    //MARK: Event and action handlers 
    func didSelectFilterButton(button: UIBarButtonItem){
        println("selected")
        
    }
    
    func didSelectFilterButton2(button: AnyObject){
        println("selected")
        
    }
    
    func setupView() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

