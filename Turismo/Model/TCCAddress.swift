//
//  TCCAddress.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 16/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import Foundation
import ObjectMapper

class TCCAddress: Mappable {
    var id : Int?
    var street : String?
    var neighborhood : String?
    var city : String?
    var state : String?
    var complement : String?
    var created : DateComponents?
    var modified : DateComponents?
    var lat : CLLocationDegrees?
    var lng : CLLocationDegrees?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        street <- map["street"]
        neighborhood <- map["neighborhood"]
        city <- map["city"]
        state <- map["state"]
        complement <- map["complement"]
        created <- map["created"]
        modified <- map["modified"]
        lat <- map["lat"]
        lng <- map["lng"]
    }
    
}
