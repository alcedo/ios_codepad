//
//  PhotoTableViewDataSource.swift
//  codepath_wk1e1
//
//  Created by Victor Liew on 5/3/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class PhotoTableViewDataSource: NSObject, UITableViewDataSource {
    
    var mediaArray: JSON?
    let instagram = InstagramModel()
    
    func doLoad(tableView: UITableView) {
        instagram.getPopular({ data in
            self.mediaArray = JSON(data!)
            tableView.reloadData()
        })
        
    }
    
    func getUserNameForSectionAtIndexPath(index: Int) -> String {
        if let media = self.mediaArray {
            return self.mediaArray!["data"][index]["user"]["username"].stringValue
        }else {
            return "Loading..."
        }
    }
    
    // MARK: - TableView data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let media = self.mediaArray {
            return media["data"].count
        }else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "instagram_photo_cell_identifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as PhotoTableViewCell?
        
        if (cell == nil) {
            cell = PhotoTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        
        // Build Image Holder
        var url: NSURL?
        if let media = self.mediaArray {
            let urlString = media["data"][indexPath.section]["images"]["standard_resolution"]["url"].stringValue
            url = NSURL(string: urlString)
        }else {
            url = NSURL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")
        }
        
        if let data = NSData(contentsOfURL: url!) {
            let imageHolder = UIImageView(image: UIImage(data: data))
            imageHolder.contentMode = UIViewContentMode.ScaleAspectFit
            cell!.contentView.addSubview(imageHolder)
            
            imageHolder.snp_makeConstraints{ (make) -> Void in
                make.height.equalTo(300)
                make.top.equalTo(cell!.contentView.snp_top).offset(50)
                make.width.equalTo(300)
                make.centerX.equalTo(cell!.contentView.snp_centerX)
                return
            }
        }
        
        // Build Cell Header
        return cell!;
    }
    
    
    
    
}