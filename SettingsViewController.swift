//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Dhriti Chawla on 12/18/17.
//  Copyright © 2017 Dhriti Chawla. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var themeControl: UISwitch!
    @IBOutlet weak var defaultThing: UISegmentedControl!
    
    let tipPercentages = [0.18, 0.2, 0.25]
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = Foundation.UserDefaults.standard
        let value1 = defaults.integer(forKey: "default")
        defaultThing.selectedSegmentIndex = value1
        
        let value2 = defaults.bool(forKey: "switch")
        themeControl.isOn = value2
        
        
    }
    
    @IBAction func defaultValueChanged(_ sender: Any) {
        let defaults = Foundation.UserDefaults.standard
        defaults.set(defaultThing.selectedSegmentIndex, forKey: "default")
        defaults.set(themeControl.isOn, forKey: "switch")
        
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
