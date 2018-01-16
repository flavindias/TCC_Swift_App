//
//  Reachability.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 16/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Reachability {
    func getLocals(_ local: TCCLocal, completion: @escaping (_ success: Bool, _ locals: [TCCLocal], _ message: String) -> ()){
        Alamofire.request("http://api.tcc.flavindias.com.br/locals/")
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[TCCLocal]>) in
                if let localsArray = response.result.value{
                    completion(true, localsArray, "")
                }
            })
    }
}
