//
//  SecondViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var BudgetLabel1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let x = UserDefaults.standard.object(forKey: "fixedExpenseInput") as? String{
            BudgetLabel1.text = x
        }
        print (UserDefaults.standard.object(forKey: "fixedExpenseInput"))

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
