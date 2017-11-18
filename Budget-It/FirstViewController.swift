//
//  FirstViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class FirstViewController: UIViewController {
    
 
    @IBOutlet weak var Text1: UITextField!

    @IBOutlet weak var Text2: UITextField!

    @IBOutlet weak var Text3: UITextField!
    @IBOutlet weak var Text4: UITextField!
    @IBOutlet weak var Text5: UITextField!
    @IBAction func NextButton(_ sender: Any) {
        self.view.endEditing(true)
        
        if(isKeyPresentInUserDefaults(key: "Text1")){
            UserDefaults.standard.removeObject(forKey: "Text1")
            UserDefaults.standard.set(Text1.text,forKey: "Text1")
        }
        else{
            UserDefaults.standard.set(Text1.text,forKey: "Text1")
        }
        if(isKeyPresentInUserDefaults(key: "Text2")){
            UserDefaults.standard.removeObject(forKey: "Tex2")
            UserDefaults.standard.set(Text2.text,forKey: "Text2")
        }
        else{
            UserDefaults.standard.set(Text2.text,forKey: "Text2")
        }
        
        if(isKeyPresentInUserDefaults(key: "Text3")){
            UserDefaults.standard.removeObject(forKey: "Text3")
            UserDefaults.standard.set(Text3.text,forKey: "Text3")
        }
        else{
            UserDefaults.standard.set(Text3.text,forKey: "Text3")
        }
        if(isKeyPresentInUserDefaults(key: "Text4")){
            UserDefaults.standard.removeObject(forKey: "Text4")
            UserDefaults.standard.set(Text4.text,forKey: "Text4")
        }
        else{
            UserDefaults.standard.set(Text4.text,forKey: "Text4")
        }
        if(isKeyPresentInUserDefaults(key: "Text5")){
            UserDefaults.standard.removeObject(forKey: "Text5")
            UserDefaults.standard.set(Text5.text,forKey: "Text5")
        }
        else{
            UserDefaults.standard.set(Text5.text,forKey: "Text5")
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

