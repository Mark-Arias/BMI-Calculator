//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Mark Arias on 8/25/23.
//

import UIKit

/**
 Note: this vc is not in active use in project.
 was used earlier to demo programmatic UI dev.
 */
class SecondViewController: UIViewController {
    
    var bmiVal = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // do stuff
        
        // set properties of the vc view, root of vc
        view.backgroundColor = .gray
        
        // illustration of a programatically created view
        let label = UILabel()
        label.text = bmiVal
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}
