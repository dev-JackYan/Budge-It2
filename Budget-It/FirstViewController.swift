//
//  FirstViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {


    @IBOutlet weak var FixedExpenseInput: UITextField!
    
    @IBOutlet weak var PersonalExpensesBudget: UITextField!
    @IBOutlet weak var LoansBudget:
    UITextField!
    @IBOutlet weak var ShelterBudget: UITextField!
    @IBOutlet weak var TransportationBudget: UITextField!
    @IBOutlet weak var FoodBudget: UITextField!
    @IBAction func SubmitButton(_ sender: Any) {
        self.view.endEditing(true)
        UserDefaults.standard.set(FixedExpenseInput.text,forKey: "fixedExpenseInput")
        UserDefaults.standard.set(FoodBudget.text,forKey: "FoodBudget")
        UserDefaults.standard.set(LoansBudget.text,forKey: "LoansBudget")
        UserDefaults.standard.set(TransportationBudget.text,forKey: "TransportationBudget")
        UserDefaults.standard.set(ShelterBudget.text,forKey: "ShelterBudget")
        UserDefaults.standard.set(PersonalExpensesBudget.text,forKey: "PersonalExpensesBudget")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

