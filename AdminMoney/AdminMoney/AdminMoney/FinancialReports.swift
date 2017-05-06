//
//  FinancialReports.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 3/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import Foundation

class FinancialReports {
    var reportAddMoney:[[String:AnyObject]]
    var reportSubtractMoney:[[String:AnyObject]]
    
    init(reportAdd:[[String:AnyObject]], reportSubtract:[[String:AnyObject]]) {
        self.reportAddMoney = reportAdd
        self.reportSubtractMoney = reportSubtract
    }
    
    convenience init() {
        self.init(reportAdd:[["MoneyToKeep":0.0 as AnyObject, "Concept":"" as AnyObject, "Date":"" as AnyObject]], reportSubtract:[["MoneyToWithdraw":0.0 as AnyObject, "Concept":"" as AnyObject, "Date":"" as AnyObject]])
    }
    
    
    func addMoney(moneyToKeep:Double, concept:String, date:String){
        let report = ["MoneyToKeep":moneyToKeep, "Concept":concept, "Date":date] as [String : Any]
        self.reportAddMoney.append(report as [String : AnyObject])
    }
    
    func subtractMoney(moneyToWithdraw:Double, concept:String, date:String){
        let report = ["MoneyToWithdraw":moneyToWithdraw, "Concept":concept, "Date":date] as [String : Any]
        self.reportSubtractMoney.append(report as [String : AnyObject])
    }
    
    
}
