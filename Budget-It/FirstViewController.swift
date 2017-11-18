//
//  FirstViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var FixedBudgetInput: UITextField!
    
        //
//    @IBAction func SubmitButton(_ sender: Any) {
//        self.view.endEditing(true)
//        if(isKeyPresentInUserDefaults(key: "fixedExpenseInput")){
//            UserDefaults.standard.removeObject(forKey: "fixedExpenseInput")
//         UserDefaults.standard.set(FixedExpenseInput.text,forKey: "fixedExpenseInput")
//        }
//        else{
//             UserDefaults.standard.set(FixedExpenseInput.text,forKey: "fixedExpenseInput")
//        }
//        
//    }
    @IBAction func NextButton(_ sender: Any) {
        self.view.endEditing(true)
        if(isKeyPresentInUserDefaults(key: "fixedExpenseInput")){
            UserDefaults.standard.removeObject(forKey: "fixedExpenseInput")
            UserDefaults.standard.set(FixedBudgetInput.text,forKey: "fixedExpenseInput")
        }
        else{
            UserDefaults.standard.set(FixedBudgetInput.text,forKey: "fixedExpenseInput")
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        //addToolBar(textField: FixedExpenseInput)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}
/*
extension UIViewController: UITextFieldDelegate {
    func addToolBar(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76 / 255, green: 217 / 255, blue: 100 / 255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    func donePressed() {
        view.endEditing(true)
    }
    
    func cancelPressed() {
        view.endEditing(true) // or do something
    }
}*/

