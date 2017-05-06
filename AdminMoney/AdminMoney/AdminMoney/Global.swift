//
//  Global.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 3/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import Foundation
import UIKit

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
