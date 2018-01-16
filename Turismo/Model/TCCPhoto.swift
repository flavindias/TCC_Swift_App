//
//  TCCPhoto.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 16/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class TCCPhoto: Mappable {
    var id : Int?
    var url : String?
    var created : DateComponents?
    var modified : DateComponents?
    var local_id : Int?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        url <- map["url"]
        created <- map["created"]
        modified <- map["modified"]
        local_id <- map["local_id"]
    }
}
