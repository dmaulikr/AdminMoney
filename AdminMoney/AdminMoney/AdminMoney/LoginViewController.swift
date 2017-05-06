//
//  LoginViewController.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 2/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK:-IBOutlet
    @IBOutlet weak var txfUser: UITextField!
    @IBOutlet weak var txfPassword: UITextField!
    @IBOutlet var gestureLogin: UITapGestureRecognizer!
    @IBOutlet weak var containerLogin: UIView!
    
    
    
    //MARK:-Properties
    let segueId = "Login-Home"

    override func viewDidLoad() {
        super.viewDidLoad()
        gestureLogin = UITapGestureRecognizer(target: self, action: #selector(hiddenKeyBoard))
        view.addGestureRecognizer(gestureLogin)
        containerLogin.addGestureRecognizer(gestureLogin)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:-IBAction
    @IBAction func logIn(_ sender: Any) {
        performSegue(withIdentifier: segueId, sender: nil)
    }
    
    //MARK:-Utils
    
    @IBAction func unwindLogIn(segue:UIStoryboardSegue){
        
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
