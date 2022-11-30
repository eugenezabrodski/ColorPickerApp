//
//  SecondViewController.swift
//  ColorPickerApp
//
//  Created by Евгений Забродский on 30.11.22.
//

import UIKit

class SecondViewController: UIViewController {

    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var opacity:CGFloat = 1
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueTF: UITextField!
    @IBOutlet weak var opacitySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func sliderAction(_ sender: UISlider) {
        updateColor()
        blueTF.text = String(blueSlider.value)
        greenTF.text = String(greenSlider.value)
        redTF.text = String(redSlider.value)
    }
    
    
    
    @IBAction func actionTF(_ sender: UITextField) {
        textFieldActionUpdateColor()
        updateColor()
    }
    

    
    
    func updateColor() {
        red = CGFloat(redSlider.value)
        green = CGFloat(greenSlider.value)
        blue = CGFloat(blueSlider.value)
        opacity = CGFloat(opacitySlider.value)
        let color = UIColor(red: red, green: green, blue: blue, alpha: opacity)
        colorView.backgroundColor = color
    }
    
    func textFieldActionUpdateColor() {
        guard let redText = redTF.text,
        let greenText = greenTF.text,
              let blueText = blueTF.text else { return }
        if let redValue = Float(redText) {
            if redValue > 1 {redSlider.value = 1.0 }
            else {
                redSlider.value = redValue
            }
        }
        if let greenValue = Float(greenText) {
            if greenValue > 1 {greenSlider.value = 1.0 }
            else { greenSlider.value = greenValue }
        }
        if let blueValue = Float(blueText) {
            if blueValue > 1 {blueSlider.value = 1.0 }
            else { blueSlider.value = blueValue }
        }
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
