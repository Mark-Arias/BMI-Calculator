//
//  CalculateViewController.swift
//  BMI Calculator
//

import UIKit

/**
 Primary vc and start point in app.
 Manages the view that let's a user calculate their BMI via sliders.
 Data passed to result vc for display to user.
 */
class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain() // model instance
        
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    // creating an outlet to the sliders makes their set values publicly available
    // so that these val's can be used in any other function
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // controls val shown on label via slider's changing val's
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightLabel.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        weightLabel.text = String(Int(sender.value)) + " Kg"
    }
    
    /*
     Performs bmi calc with model method calculateBMI() via passed in height and weight vals
     from the sliders. Result vc is then launched via segue.
     */
    @IBAction func calculatePressed(_ sender: Any) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        // activate segue from this vc to linked vc on storyboard
        // this segue itself is identified via the string param below on the storyboard
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // method used to prepare and config destination vc
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {   // set what to prepare for based on id match
            let destinationVC = segue.destination as! ResultViewController // downcast new vc to type result vc
            // set the public properties below of newly built vc object to val's computed by our model methods
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

