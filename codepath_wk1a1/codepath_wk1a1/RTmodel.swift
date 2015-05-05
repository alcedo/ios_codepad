//
//  RTmodel.swift
//  codepath_wk1a1
//
//  Created by Victor Liew on 5/5/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import Foundation

class RTmodel: NSObject {

    func getBoxOffice(callBack: (AnyObject?)-> Void) {
        let url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=3&country=us&apikey=f2fk8pundhpxf77fscxvkupy"
        
        let manager = AFHTTPRequestOperationManager()
        let request = AFJSONRequestSerializer().requestWithMethod("GET", URLString: url, parameters: nil, error: nil)
        let op = AFHTTPRequestOperation(request: request)
        op.responseSerializer = AFJSONResponseSerializer()
        op.setCompletionBlockWithSuccess({ (AFHTTPRequestOperation, dataObject) -> Void in
            callBack(dataObject)
        }, failure: nil)
        
        NSOperationQueue.mainQueue().addOperation(op)
    }
    
    func getInTheatre(callBack: (AnyObject?)-> Void) {
        let url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?page_limit=16&page=1&country=us&apikey=f2fk8pundhpxf77fscxvkupy"
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer = AFJSONResponseSerializer();
        manager.GET(url, parameters: nil, success: {(operation, responseObject) -> Void in
            callBack(responseObject)
        }, failure: nil)
    }
}