//
//  foodDictionary.swift
//  ctavenne-Lab2
//
//  Created by Cody Tavenner on 2/4/19.
//  Copyright © 2019 Cody Tavenner. All rights reserved.
//

import Foundation
class foodDictionary
{
    // dictionary that stores food records
    var foodRepository : [String:foodRecord] = [String:foodRecord] ()
    init() { }
    
    
    func add(p:foodRecord)
    {
        print("adding" + p.food!)
        foodRepository[p.food!] = p
        
    }
    
    func search(s:String) -> foodRecord?
    {
        var found = false
        
        for (food, _) in foodRepository
        {
            if food == s {
                found = true
                break
            }
        }
        if found
        {
            return foodRepository[s]
        }else  {
            
            return nil
        }
    }
    
    func deleteRec(s:String)
    {
        foodRepository[s] = nil
    }
    
    
}
