//
//  Persona.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 3/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import Foundation

class PersonSingleton{
    var name:String
    var lastName:String
    var id:String
    var account:BankAccount
    var country:String
    
    static let sharedInstance:PersonSingleton = PersonSingleton()
    
    private init() {
        self.name = ""
        self.lastName = ""
        self.id = ""
        self.account = BankAccount()
        self.country = ""
    }
    
    func fillSingleton(name:String, lastName:String, id:String, account:BankAccount, country:String){
        PersonSingleton.sharedInstance.name = name
        PersonSingleton.sharedInstance.lastName = lastName
        PersonSingleton.sharedInstance.id = id
        PersonSingleton.sharedInstance.account = account
        PersonSingleton.sharedInstance.country = country
    }

}
