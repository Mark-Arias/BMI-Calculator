//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Mark Arias on 8/25/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

/*
 Idea to Investigate.
 Let's say you have some data or thing you calculated inside this vc,
 how do you send it from here, back to the original vc you started in prior to this one?
 See if I can segue backwards...
 */

/**
 This vc displays calculated bmi info to a user modally.
 */
class ResultViewController: UIViewController {
    
    // Properties below are publicly exposed, and are used via segue to init these var's
    // with passed in calculated val's from model methods.
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // init object with values if available from these var's
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    // Simply closes screen upon user pressing recalc button.
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true) // close out the current screen
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
