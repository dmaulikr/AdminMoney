//
//  BankAccount.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 3/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import Foundation

class BankAccount{
    var idBankAccount:String
    var currentMoney:Double
    var reports:FinancialReports
    
    init (idBankAccount:String, currentMoney:Double, reports:FinancialReports){
        self.idBankAccount = idBankAccount
        self.currentMoney = currentMoney
        self.reports = reports
    }
    
    convenience init() {
        self.init(idBankAccount:"0", currentMoney:0.0, reports:FinancialReports())
    }
    
    func addMoney(money:Double){
        self.currentMoney += money
    }
    
    func subtractMoney(money:Double){
        self.currentMoney -= money
    }
}
