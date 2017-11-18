//
//  SecondViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Text1: UILabel!
    
    @IBOutlet weak var Text2: UILabel!

    @IBOutlet weak var Text3: UILabel!
    
    @IBOutlet weak var Text4: UILabel!

    @IBOutlet weak var Text5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let x = UserDefaults.standard.object(forKey: "Text1") as? String{
            Text1.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "Text2") as? String{
            Text2.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "Text3") as? String{
            Text3.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "Text4") as? String{
            Text4.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "Text5") as? String{
            Text5.text = x
        }
     
     
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
