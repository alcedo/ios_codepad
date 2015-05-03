//
//  PhotoTableViewCell.swift
//  codepath_wk1e1
//
//  Created by Victor Liew on 5/3/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import UIKit
import Snap

class PhotoTableViewCell: UITableViewCell {
    
    var imageHolder: UIImageView?

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        if let url = NSURL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png") {
            if let data = NSData(contentsOfURL: url) {
                self.imageHolder = UIImageView(image: UIImage(data: data))
                self.imageHolder?.contentMode = UIViewContentMode.ScaleAspectFit
            }
        }
        
        self.contentView.addSubview(self.imageHolder!)
        
        self.imageHolder?.snp_makeConstraints{ (make) -> Void in
            make.height.equalTo(300)
            make.width.equalTo(300)
            make.centerX.equalTo(self.contentView.snp_centerX)
            return
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
