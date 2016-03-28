//
//  File.swift
//  Finis
//
//  Created by Arthur Carvalho on 3/28/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import Foundation

class Task  {
    
    var name: String!
    var date: String!
    var tag: String!
    
    init(name:String, date:String, tag:String) {
        self.name = name
        self.date = date
        self.tag = tag
    }
}
