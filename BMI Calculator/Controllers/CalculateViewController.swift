//
//  CalculateViewController.swift
//  BMI Calculator
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    // var calculatedBMI: Float = 0.0
    
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

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightLabel.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        weightLabel.text = String(Int(sender.value)) + " Kg"
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        // let bmi = weight / pow(height, 2)
        // calculatedBMI = bmi
        
        // create and present the second vc to the screen
        // let secondVC = SecondViewController()
        // data is being passed to second vc by accessing a property of the object, and setting it to the val
        // calculated here in this containing func, and then passing in this object to the present func.
        // secondVC.bmiVal = String(format: "%.1f", bmi)
        // self.present(secondVC, animated: true)
        
        // this method performs a segue which lets you launch and present another vc's screen
        // you do this by passing in segue identifier you specify in main.storyboard when clicking
        // on the segue, and setting it's identifier property
        // the sender is the current vc
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            // destinationVC.bmiValue = String(format: "%.1f", calculatedBMI)
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

