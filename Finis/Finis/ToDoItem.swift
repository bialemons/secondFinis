//
//  ToDoItem.swift
//  Finis
//
//  Created by Alline Pedreira on 30/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var text: String
    var completed: Bool
    
    init(text: String){
        self.text = text
        self.completed = false
    }
    

}
