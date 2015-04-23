//
//  TestAccessControl.swift
//  hello_world_programmatically
//
//  Created by Victor Liew on 4/23/15.
//  Copyright (c) 2015 Victor Liew. All rights reserved.
//

import Foundation

class AccessControlTester {
    
    init() {
        println("initialized")
    }
    
    func publicMethod() {
        println("this is a pub method")
    }
    
    private func privateMethod() {
        println("this is a pvte method")
    }
    
    internal func internalMethod() {
        println("this is an internal method")
    }
    
}