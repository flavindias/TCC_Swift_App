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
    }
    
    /*
     *   Método para conversão de datas advindas do servidor para DateComponents
     *   Entrada: String formatada no JSON
     *   Saída: Objeto do tipo DateComponetns com ano, mes dia hora e minuto
     */
    func stringToDateComponents(_ dateString: String) -> DateComponents?{
        
        let formatter1 = DateFormatter()
        
        formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"
        //        formatter1.locale = NSLocale.init(localeIdentifier: "enUSPOSIXLocale") as Locale!
        //        formatter1.timeZone = TimeZone(abbreviation: "UTC")
        let value = formatter1.date(from: dateString)
        if value != nil{
            let date = value! as Date
            let comp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
            return comp
        }
        else{
            return nil
        }
    }
}
