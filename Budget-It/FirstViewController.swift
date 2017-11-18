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
    
    @IBAction func SubmitButton(_ sender: Any) {
        UserDefaults.standard.set(FixedExpenseInput.text,forKey: "fixedExpenseInput")
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

