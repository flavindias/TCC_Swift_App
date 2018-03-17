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
    
//    retorna todos os locais
    func getLocals(completion: @escaping (_ success: Bool, _ locals: [TCCLocal], _ message: String) -> ()){
        Alamofire.request("http://api.tcc.flavindias.com.br/locals/")
            .validate()
            .responseArray(keyPath: "result.locals") { (response: DataResponse<[TCCLocal]>) in
            if let localsArray = response.result.value{
                completion(true, localsArray, "")
            }
        }
    }
    
//    retorna todos os locais de uma determinada página
    func getLocalsPaginated(page: Int, completion: @escaping (_ success: Bool, _ locals: [TCCLocal], _ message: String) -> ()){
        Alamofire.request("http://api.tcc.flavindias.com.br/locals/index?page=\(page)")
            .validate()
            .responseArray(keyPath: "result.locals") { (response: DataResponse<[TCCLocal]>) in
            if let localsArray = response.result.value{
                completion(true, localsArray, "")
            }
        }
    }
    
//    retorna as informações de um determinado local
    func getLocalDetail(local: TCCLocal, completion: @escaping (_ success: Bool, _ local: TCCLocal, _ message: String) -> ()) {
        Alamofire.request("http://api.tcc.flavindias.com.br/locals/view/\(local.id!)")
            .validate()
            .responseObject(keyPath: "result.local") { (response: DataResponse<TCCLocal>) in
            if let local = response.result.value{
                completion(true, local, "")
            }
        }
    }
}
