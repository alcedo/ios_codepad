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
    var refreshControl: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show loading spinner
        SVProgressHUD.show()
        
        self.title = "Rotten Tomatoes"
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Load box office List
        self.boxOfficeModel.getBoxOffice({ (data) -> Void in
            SVProgressHUD.dismiss()
            self.tableView!.reloadData()
            self.hideErrorHud()
        }, {(error) -> Void in
            self.showErrorHud()
        })
        
        self.setupView()
        self.hideErrorHud()
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
        
        // Refresh control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "userDidRefreshTableView:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView!.addSubview(refreshControl)
        
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
        // we can refer to self.errorHud too, but for learning sake, im doing this
        let hud = self.view.viewWithTag(self.ERROR_HUD_TAG)
        if let hud = hud {
            hud.hidden = true
        }
    }
    
    func showErrorHud() {
        if let hud = self.errorHud {
            hud.hidden = false
        }
    }
    
    func userDidRefreshTableView(refresh: UIRefreshControl) {
        self.boxOfficeModel.getBoxOffice({ (data) -> Void in
            self.tableView!.reloadData()
            refresh.endRefreshing()
            self.hideErrorHud()
        }, {(error) -> Void in
            self.showErrorHud()
        })
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var vc = MovieDetailsViewController()
        vc.movieSynopsisText = self.boxOfficeModel.getBoxOfficeSynopsisForIndex(indexPath.row)
        vc.movieImageUrl = self.boxOfficeModel.getBoxOfficeHighResForIndex(indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

