//
//  ViewController.swift
//  Tippy
//
//  Created by Dhriti Chawla on 12/16/17.
//  Copyright © 2017 Dhriti Chawla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var themeControl: UISwitch!
    @IBOutlet weak var b: UILabel!
    @IBOutlet weak var t: UILabel!
    @IBOutlet weak var tt: UILabel!
    @IBOutlet weak var edt: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = Foundation.UserDefaults.standard
        let value1 = defaults.integer(forKey: "default")
        tipControl.selectedSegmentIndex = value1
        
        let value2 = defaults.bool(forKey: "switch")
        themeControl.isOn = value2
        
        calculateTip(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.25, ]
        
        let bill = Double (billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let theme = themeControl.isOn
        if theme {
            self.view.backgroundColor = UIColor.darkGray
            self.view.tintColor = UIColor.white
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            t.textColor = UIColor.white
            b.textColor = UIColor.white
            tt.textColor = UIColor.white
            edt.textColor = UIColor.white
        }
        else {
            self.view.backgroundColor = UIColor.white
            self.view.tintColor = UIColor.black
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            t.textColor = UIColor.black
            b.textColor = UIColor.black
            tt.textColor = UIColor.black
        }
        
        tipLabel.text = String (format: "$%.2f", tip )
        
        let total = bill + tip
        totalLabel.text = String (format: "$%.2f", total )
        
    
        
    }
}

