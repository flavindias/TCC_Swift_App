//
//  TCCLocal.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 16/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class TCCLocal: Mappable {
    var id: Int?
    var name: String?
    var phone_1: String?
    var phone_2: String?
    var site: String?
    var email: String?
    var active: Bool?
    var created: DateComponents?
    var modified: DateComponents?
    var schedule_id: Int?
    var address_id: Int?
    var description: String?
    var rating: Int?
    var thumb: String?
    var address: TCCAddress?
    var schedule: TCCSchedule?
    var photos: [TCCPhoto]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        phone_1 <- map["phone_1"]
        phone_2 <- map["phone_2"]
        site <- map["site"]
        email <- map["email"]
        active <- map["active"]
        created <- map["created"]
        modified <- map["modified"]
        schedule_id <- map["schedule_id"]
        address_id <- map["address_id"]
        description <- map["description"]
        rating <- map["rating"]
        thumb <- map["thumb"]
        address <- map["address"]
        schedule <- map["schedule"]
        photos <- map["photos"]
    }
    
}
