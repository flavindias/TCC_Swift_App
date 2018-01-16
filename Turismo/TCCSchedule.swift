//
//  TCCSchedule.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 16/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import Foundation
import ObjectMapper

class TCCSchedule: Mappable {
    var id: Int?
    var monday: String?
    var tuesday: String?
    var wednesday: String?
    var thursday: String?
    var friday: String?
    var saturday: String?
    var sunday: String?
    var created: DateComponents?
    var modified: DateComponents?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        monday <- map["monday"]
        tuesday <- map["tuesday"]
        wednesday <- map["wednesday"]
        thursday <- map["thursday"]
        friday <- map["friday"]
        saturday <- map["saturday"]
        sunday <- map["sunday"]
        created <- map["created"]
        modified <- map["modified"]
    }
}
