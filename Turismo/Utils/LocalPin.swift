//
//  LocalPin.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 16/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import MapKit

class LocalPin: MKPointAnnotation {
    fileprivate var name: String?
    fileprivate var message: String?
    
    func setName(_ name: String){
        self.name = name
    }
    func setMessage(_ message: String){
        self.message = message
    }
    
    func getName() -> String? {
        return self.name
    }
    func getMessage() -> String? {
        return self.message
    }
    
    
}
