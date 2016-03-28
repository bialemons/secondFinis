//
//  Calendar.swift
//  Finis
//
//  Created by Arthur Carvalho on 3/28/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import Foundation

let dateComponents = NSDateComponents()
let day = dateComponents.day
let month = dateComponents.month
let currentDate = NSDate()
let dateFormatter = NSDateFormatter()
var dateAsString = "09-01-1995"
var newDate = dateFormatter.dateFromString(dateAsString)

