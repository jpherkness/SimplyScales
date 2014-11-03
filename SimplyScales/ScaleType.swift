//
//  ScaleType.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 10/23/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import Foundation

class ScaleType {
    var name : String
    var category : String
    var pattern : [Int]
    var intervalPattern : [String]
    
    init(name : String, category : String, pattern : [Int], intervalPattern : [String]){
        self.name = name
        self.category = category
        self.pattern = pattern
        self.intervalPattern = intervalPattern
    }
}