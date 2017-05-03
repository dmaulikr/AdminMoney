//
//  HomeViewController.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 2/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:-IBOutlet
    

    
    //MARK:-Properties
    let segueIdAddSubtract = "AddSubtract"
    var information = InformationAddSubtract()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:-IBAction
    @IBAction func addMoney(_ sender: Any) {
        information.titleNavigationItem = "Agregar Dinero"
        information.titleView = "Que bien!!! Tienes dinero para sumar a la cuenta"
        information.titleTextField = "¿Cuanto Dinero vamos a guardar?"
        information.titleTextView = "¿Cual es el concepto?"
        performSegue(withIdentifier: segueIdAddSubtract, sender: information)
    }
    
    @IBAction func subtractMoney(_ sender: Any) {
        information.titleNavigationItem = "Gastos"
        information.titleView = "Vas a hacer un gasto, gasta cuidadosamente"
        information.titleTextField = "¿Cuanto dinero deseas gastar?"
        information.titleTextView = "¿Cual es el concepto?"
        performSegue(withIdentifier: segueIdAddSubtract, sender: information)
    }
    
    
    @IBAction func logOut(_ sender: Any) {
    }
    

    
    @IBAction func unwindHome(segue:UIStoryboardSegue){
    }
    
    
    //MARK:-Utils
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? AddSubtractViewController{
            nextVC.information = sender as? InformationAddSubtract
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

struct InformationAddSubtract {
    var titleNavigationItem:String
    var titleView:String
    var titleTextField:String
    var titleTextView:String
    
    
    init(titleNavigationItem:String, titleView:String, titleTextField:String, titleTextView:String) {
        self.titleNavigationItem = titleNavigationItem
        self.titleView = titleView
        self.titleTextField = titleTextField
        self.titleTextView = titleTextView
    }
    
    init() {
        self.titleNavigationItem = ""
        self.titleView = ""
        self.titleTextField = ""
        self.titleTextView = ""
    }
    
}









