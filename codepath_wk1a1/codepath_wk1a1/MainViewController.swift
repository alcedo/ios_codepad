//
//  ViewController.swift
//  codepath_wk1a1
//
//  Created by Victor Liew on 5/2/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import UIKit
import Snap

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    var boxOfficeModel = RTmodel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rotten Tomatoes"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.boxOfficeModel.getBoxOffice({ (data) -> Void in
            self.tableView!.reloadData()
        })
        
        
        self.setupView()
    }
    
    func setupView() {
        self.tableView = UITableView(frame: CGRectMake(0, 0, 100, 100), style: .Plain)
        if let tv = self.tableView {
            self.view.addSubview(tv)
            
            tv.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.view.snp_top)
                make.height.equalTo(self.view.snp_height)
                make.width.equalTo(self.view.snp_width)
                return
            }
            
            tv.delegate = self
            tv.dataSource = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Delegates
    
    //MARK: Data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boxOfficeModel.getBoxOfficeDataCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "rt_cell")
        let data = NSData(contentsOfURL: self.boxOfficeModel.getBoxOfficeThumbUrlForIndex(indexPath.row))
        cell.imageView?.image = UIImage(data: data!)
        cell.textLabel?.text = self.boxOfficeModel.getBoxOfficeMovieTitleForIndex(indexPath.row)
        cell.detailTextLabel?.text = self.boxOfficeModel.getBoxOfficeSynopsisForIndex(indexPath.row)
        return cell
    }

}

