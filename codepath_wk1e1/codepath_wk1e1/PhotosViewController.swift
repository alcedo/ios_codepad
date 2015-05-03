//
//  ViewController.swift
//  codepath_wk1e1
//
//  Created by Victor Liew on 5/2/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import UIKit
import Snap
import SwiftyJSON

//http://stackoverflow.com/questions/5714528/difference-between-uitableviewdelegate-and-uitableviewdatasource
class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let instagram = InstagramModel()
    var mediaArray: JSON?
    var tableView: UITableView?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setupViewStructure()
        self.setupConstrain()
    }
    
    // MARK: - UI View Creations Goes Here
    func setupViewStructure() {
        self.tableView = UITableView(frame: CGRectMake(0, 0, 300, 300), style: .Plain)
        if let tv = self.tableView {
            self.view.addSubview(tv)
            tv.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.view.snp_top)
                make.height.equalTo(self.view.snp_height)
                make.width.equalTo(self.view.snp_width)
                return
            }
            
            tv.autoresizesSubviews = true
            tv.dataSource = self;
            tv.delegate = self;
        }
    }
    
    // MARK: - Constraints
    func setupConstrain() {
        
    }
    
    // MARK: - TableView data source 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300.00
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "instagram_photo_cell_identifier"
        var cell = self.tableView?.dequeueReusableCellWithIdentifier(cellIdentifier) as PhotoTableViewCell?
        
        if(cell == nil) {
            cell = PhotoTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        return cell!;
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instagram.getPopular({ data in
            self.mediaArray = JSON(data!)
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

