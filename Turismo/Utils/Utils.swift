//
//  Utils.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 17/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import Foundation

class Utils {
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
