//
//  SignInViewController.swift
//  AdminMoney
//
//  Created by JUAN DAVID LOPERA on 3/05/17.
//  Copyright © 2017 JuanCompany. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    
    //MARK:-IBOutlet
    @IBOutlet weak var txfName: UITextField!
    @IBOutlet weak var txfLastName: UITextField!
    @IBOutlet weak var txfId: UITextField!
    @IBOutlet weak var txfCountry: UITextField!
    @IBOutlet weak var txfBalance: UITextField!
    
    @IBOutlet weak var contraintBottomTxfBalance: NSLayoutConstraint!

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var scrollContainer: UIScrollView!
    
    @IBOutlet var gesture: UITapGestureRecognizer!
    
    //MARK:-Properties
    let countryList = ["","Colombia","España","Mexico"]
    let pickerCountryList = UIPickerView()
    
    var keyBoardHeight:CGFloat!
    
    var notificacion = NotificationCenter.default
    //Creo un array con todos los textField en este controlador
    var arrayTextField:[UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Inicializo el array
        arrayTextField = [txfName,txfId,txfLastName,txfCountry,txfBalance]
        
        pickerCountryList.delegate = self as? UIPickerViewDelegate
        pickerCountryList.dataSource = self as? UIPickerViewDataSource
        
        gesture = UITapGestureRecognizer(target: self, action: #selector(hiddenKeyBoard))
        scrollContainer.addGestureRecognizer(gesture)
        container.addGestureRecognizer(gesture)
        view.addGestureRecognizer(gesture)
        
        //Añado al text de paises, una lista de paises en forma de picker
        txfCountry.inputView = pickerCountryList
        
        //modifico el key return de cada textField
        txfName.returnKeyType = .done
        txfLastName.returnKeyType = .done
        txfId.returnKeyType = .done
        
        //Añado al text de saldo un boton de donde en la parte superior derecha
        txfBalance.addDoneButtonToKeyboard(myAction: #selector(txfBalance.resignFirstResponder))
        
        //creo las notificaciones para cuando el teclado aparezca y asi evitar ocultar el textField
        notificacion.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificacion.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificacion.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificacion.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK:-IBAction
    @IBAction func signIn(_ sender: Any) {
        //Creo una variable tipo sentinela que me sirve para saber si entro al if
        var noneEmpty:Bool = false
        /*Creo un forEach para recorrer cada textField declarado en el array de textField y verifico que ninguno este vacio
         en caso de esta vacio alguno, entonces pongo la variable tipo sentinela en false y me salgo del forEach
         */
        for textField in arrayTextField{
            if textFieldIsNoEmpty(textField: textField){
                noneEmpty = true
            }else{
                noneEmpty = false
                break
            }
        }
        /*
         si despues del for la variable tipo sentinela queda en true, entonces proceso a crear el usuario nuevo, en caso de que
         quede en false entonces muestro una alerta donde digo que existen campos vacios y limpio los textField
         */
        if noneEmpty{
            //En caso de tener todos los textField completos, entonces creo al usuario y lo meto al singleton
            let newPerson = Person(name: txfName.text!, lastName: txfLastName.text!, id: txfId.text!, account: BankAccount(), country: txfCountry.text!)
            var balance = txfBalance.text?.replacingOccurrences(of: ",", with: ".")
            print(txfBalance.text!)
            newPerson.initAccount(beginningBalance: Double(balance!)!)
            print("LLego :)  --    \(balance)")

        }else{
            //Muestro la alerta, esta funcion esta declarada en Global.swift
            showAlert(titleMessage: "emptyField")
            
            //Procedo a limpiar todos los textField
            for emptyTextField in arrayTextField{
                emptyTextField.text = ""
            }
        }
        
    }

    
    //MARK:-Utils
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return countryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txfCountry.text = countryList[row]
        self.view.endEditing(false)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    //Funcion para saber si un textField esta vacio o no
    func textFieldIsNoEmpty(textField:UITextField)->Bool{
        if textField.text?.characters.count == 0{
            return false
        }else{
            return true
        }
        
    }
    
    func setScrollViewPosition(){
        // Modificamos el valor de la constante del constraint inferior, le damos la altura del teclado más 20 de marge. De este modo estamos agrandando el Scroll View lo suficiente para poder hacer scroll hacia arriba y trasladar el UITextField hasta que quede a la vista del usuario. Ejecutamos el cambio en el constraint con la función layoutIfNeeded().
        contraintBottomTxfBalance.constant = keyBoardHeight + 20
        self.view.layoutIfNeeded()
        
        // Calculamos la altura de la pantalla
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight: CGFloat = screenSize.height
        print("La pantalla mide: \(screenHeight)")
        
        // Recorremos el array de textFields en busca de quien tiene el foco
        for textField in arrayTextField {
            if textField.isFirstResponder {
                // Guardamos la posición 'Y' del UITextField
                let yPositionField = textField.frame.origin.y
                // Guardamos la altura del UITextField
                let heightField = textField.frame.size.height
                // Calculamos la 'Y' máxima del UITextField
                let yPositionMaxField = yPositionField + heightField
                // Calculate max Y position for a view that is not hidden
                let Ymax = screenHeight - keyBoardHeight
                print("El textField llega hasta: \(yPositionMaxField), la Ymax es: \(Ymax)")
                // Comprobamos si nuestra 'Y' máxima del UITextField es superior a la Ymax
                if Ymax < yPositionMaxField {
                    // Comprobar si la 'Ymax' el UITextField es más grande que el tamaño de la pantalla
                    if yPositionMaxField > screenHeight {
                        let diff = yPositionMaxField - screenHeight
                        print("El UITextField se sale por debajo \(diff) unidades")
                        // Hay que añadir la distancia a la que está por debajo el UITextField ya que se sale del screen height
                        scrollContainer.setContentOffset(CGPoint(x: 0, y: self.keyBoardHeight + diff), animated: true)
                        //scrollContainer.setContentOffset(CGPointMake(0, self.keyBoardHeight + diff), animated: true)
                    }else{
                        // El UITextField queda oculto por el teclado, entonces movemos el Scroll View
                        scrollContainer.setContentOffset(CGPoint(x: 0, y: self.keyBoardHeight - 20), animated: true)
                    }
                    
                }else{
                    print("NO MUEVO EL SCROLL")
                }
            }
        }
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        var info:Dictionary = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyBoardHeight = keyboardSize.height
        setScrollViewPosition()
    }
    
    func keyboardWillHide(notification: NSNotification) {
        contraintBottomTxfBalance.constant = 40
        self.view.layoutIfNeeded()
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
