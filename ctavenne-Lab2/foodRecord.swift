//
//  foodRecord.swift
//  ctavenne-Lab2
//
//  Created by Cody Tavenner on 2/4/19.
//  Copyright © 2019 Cody Tavenner. All rights reserved.
//

import Foundation
class foodRecord
{
    var restaurant:String? = nil
    var food:String? = nil

    init(r:String, f:String) {
        self.restaurant = r
        self.food = f
    }
    
    func change_restaurant(newRest:String)
    {
        self.restaurant = newRest;
    }
    
}
