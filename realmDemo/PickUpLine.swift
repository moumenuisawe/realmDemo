//
//  PickUpLine.swift
//  realmDemo
//
//  Created by moumen isawe on 2/7/19.
//  Copyright © 2019 moumen. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class PickUpLine :Object{
    dynamic var line:String = ""
    let score = RealmOptional<Int>()
    dynamic var email:String? = ""

   convenience init(line:String,score:Int?,email:String?) {
        self.init()
        self.email = email
        self.score.value = score
        self.line = line
    }
    
    
    func scoreString ()->String?{
        guard let score = score.value else{ return nil }
        return String(score)
    }

}

