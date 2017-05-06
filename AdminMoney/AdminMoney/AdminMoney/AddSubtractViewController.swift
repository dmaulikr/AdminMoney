//
//  AddSubtractViewController.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 2/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import UIKit

class AddSubtractViewController: UIViewController {

    //MARK:-IBOutlet
    @IBOutlet var gesture: UITapGestureRecognizer!
    @IBOutlet weak var informationContainer: UIView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var titleTextField: UILabel!
    @IBOutlet weak var titleTextView: UILabel!
    
    
    
    //MARK:-Properties
    var information:InformationAddSubtract?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gesture = UITapGestureRecognizer(target: self, action: #selector(hiddenKeyBoard))
        informationContainer.addGestureRecognizer(gesture)
        view.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = information?.titleNavigationItem
        titleView.text = information?.titleView
        titleTextView.text = information?.titleTextView
        titleTextField.text = information?.titleTextField
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:-IBAction

    
    
    //MARK:-Utils
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
