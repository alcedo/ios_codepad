//
//  ViewController.swift
//  codepath_wk1a1
//
//  Created by Victor Liew on 5/2/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import UIKit
import Snap
import SVProgressHUD

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    var boxOfficeModel = RTmodel()
    var errorHud: UIView?
    let ERROR_HUD_TAG = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show loading spinner
        SVProgressHUD.show()
        
        self.title = "Rotten Tomatoes"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.boxOfficeModel.getBoxOffice({ (data) -> Void in
            SVProgressHUD.dismiss()
            self.tableView!.reloadData()
        })
        
        self.setupView()
    }
    
    func setupView() {
        // Add table view
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
        
        // Add network error messsages
        let errorHud = UIView(frame: CGRectMake(0, 0, 0, 0))
        errorHud.tag = self.ERROR_HUD_TAG
        self.view.addSubview(errorHud)
        self.errorHud = errorHud
        errorHud.backgroundColor = UIColor.redColor()
        errorHud.snp_makeConstraints { (make) -> Void in
            if let nvc = self.navigationController {
                let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
                let errorHudHeight = 20
                make.top.equalTo(self.view.snp_top).offset(navigationBarHeight + 20)
                make.width.equalTo(self.view.snp_width)
                make.height.equalTo(errorHudHeight)
            }
            return
        }
        
        // errorHud label
        let errorHudLabel = UILabel()
        errorHudLabel.text = "Network Error, please try again"
        errorHudLabel.sizeToFit()
        errorHud.addSubview(errorHudLabel)
    }
    
    func hideErrorHud() {
        
    }
    
    func showErrorHud() {
        
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
        let cellIdentifier = "photo_cell_identifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell?
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        if let cell = cell {
            let data = NSData(contentsOfURL: self.boxOfficeModel.getBoxOfficeThumbUrlForIndex(indexPath.row))
            cell.imageView?.image = UIImage(data: data!)
            cell.textLabel?.text = self.boxOfficeModel.getBoxOfficeMovieTitleForIndex(indexPath.row)
            cell.detailTextLabel?.text = self.boxOfficeModel.getBoxOfficeSynopsisForIndex(indexPath.row)
            return cell
        }
        
        return UITableViewCell() // return empty cell if all else fails
    }

}

