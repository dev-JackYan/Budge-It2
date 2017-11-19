//
//  SecondViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBOutlet weak var InputField: UITextField!
    @IBOutlet weak var Label1: UILabel!
    
    var currentCategory: String = "Fixed Expense"
  
    
    
    let categories = ["Fixed Expenses", "Food", "Loans", "Transportation", "Personal Expenses"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row : Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent row : Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row : Int, inComponent component: Int)  {
        
        currentCategory = categories[row]
    }
    
    
    @IBAction func EnterButton(_ sender: Any) {
        
        var textNumber: String = ""
        if (currentCategory == "Fixed Expense"){
            textNumber = "CurrentExpense1"
        }
        else if (currentCategory == "Food"){
            textNumber = "CurrentExpense2"
        }
        else if (currentCategory == "Loans"){
            textNumber = "CurrentExpense3"
        }
        else if (currentCategory == "Transportation"){
            textNumber = "CurrentExpense4"
        }
        else if (currentCategory == "Personal Expenses"){
            textNumber = "CurrentExpense5"
        }
        let x = UserDefaults.standard.object(forKey: textNumber) as? String
        print(textNumber)
        print(x)
        let currentExpense =  Int(x!)
        print (currentExpense)
        var text = InputField.text
        var int_Text = Int(text!)
        let newExpense = currentExpense! - int_Text!
        let string_NewExpense = String(newExpense)
        UserDefaults.standard.removeObject(forKey: textNumber)
        UserDefaults.standard.set(string_NewExpense,forKey: textNumber)
        print(string_NewExpense)
        //        self.performSegue(withIdentifier: "Segue1", sender: self)
        

    }
    
        override func viewDidLoad() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
            
            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false
            
            view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //    override func viewDidDisappear(_ animated: Bool) {
    //
    //    }
    //
    //    
    
    
    
}
