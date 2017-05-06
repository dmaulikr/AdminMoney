//
//  Person.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 5/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import Foundation

class Person {
 
    var name:String
    var lastName:String
    var id:String
    var account:BankAccount
    var country:String
    
    init(name:String = "none", lastName:String = "none", id:String = "0", account:BankAccount = BankAccount(), country:String = "") {
        self.name = name
        self.lastName = lastName
        self.id = id
        self.account = account
        self.country = country
    }
    
    func initAccount(beginningBalance:Double){
        account.idBankAccount = country + name + id
        account.currentMoney = beginningBalance
        
    }

}
