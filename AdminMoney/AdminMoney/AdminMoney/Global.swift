//
//  Global.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 3/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

//Variables o constantes

let startBranchUsers = "Users"
let branchAccount = "Account"
let brancReports = "Reports"


extension UIViewController{
    func hiddenKeyBoard(){
        view.endEditing(true)
    }
    
    func showAlert(titleMessage:String){
        var title = ""
        var message = ""
        var action = ""
        switch titleMessage {
        case "emptyField":
            title = "Campos Vacios"
            message = "Lo siento, no podemos crearte como usuario mientras existan campos vacios"
            action = "ACEPTAR"
        default:
            title = "for default"
            message = "for default"
            action = "default"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: action, style: .default, handler: nil)
        alert.addAction(actionOK)
        present(alert, animated: true, completion: nil)
    }
    
    func fireBasePostNewUser(person:Person){
        
        let newUser = ["id" : person.id,
                       "name" : person.name,
                       "lastName" : person.lastName,
                       "country" : person.country]
        
        let nameUser = person.name.replacingOccurrences(of: " ", with: "_")
        let lastNameUser = person.lastName.replacingOccurrences(of: " ", with: "_")
        let branchId = nameUser + "_" + lastNameUser
        
        let dataBaseReference = FIRDatabase.database().reference()
        
        //Creo al usuario en firebase
        dataBaseReference.child(startBranchUsers).child(branchId).setValue(newUser)
        
        
    }
    
    //Creo la cuenta del usuario en firebase
    func fireBasePostAccountUser(person:Person,userBranchId:String){
        
        let infoAccount:[String:Any] = ["id" : person.account.idBankAccount,
                                        "currentMoney" : person.account.currentMoney,]
        
        let dataBaseReference = FIRDatabase.database().reference()
        dataBaseReference.child(startBranchUsers).child(userBranchId).child(branchAccount).setValue(infoAccount)
        
    }
    
    //Creo los reportes del usuario
    func fireBasePostReports(person:Person,userBranchId:String){
        let report = ["reportAddMoney" : person.account.reports.reportAddMoney,
                      "reportSubtractMoney" : person.account.reports.reportSubtractMoney]
        
        let dataBaseReference = FIRDatabase.database().reference()
        dataBaseReference.child(startBranchUsers).child(userBranchId).child(branchAccount).child(brancReports).setValue(report)
    }
}

extension UITextField{
    
    func addDoneButtonToKeyboard(myAction:Selector?){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: myAction)
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
}
