//
//  TCCAddress.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 16/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import Foundation
import CoreLocation
import ObjectMapper

class TCCAddress: Mappable {
    var id : Int?
    var street : String?
    var neighborhood : String?
    var city : String?
    var state : String?
    var complement : String?
    var created : String?
    var modified : String?
    var lat : Double?
    var lng : Double?
    
    private let utils = Utils()
    
    let transformDouble = TransformOf<Double, String>(fromJSON: { (value: String?) -> Double? in
        // transforma o valor da String? em Double?
        return Double(value!)
    }, toJSON: { (value: Double?) -> String? in
        // transforma o valor da Double? em String?
        if let value = value {
            return String(value)
        }
        return nil
    })
    
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
        lat <- (map["lat"], transformDouble)
        lng <- (map["lng"], transformDouble)
    }
    
}
