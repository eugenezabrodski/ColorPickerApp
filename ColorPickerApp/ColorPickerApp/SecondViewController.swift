//
//  SecondViewController.swift
//  ColorPickerApp
//
//  Created by Евгений Забродский on 30.11.22.
//

import UIKit



final class SecondViewController: UIViewController {

    //MARK: - Properties
    
    var newColor: UIColor?

    var delegate: ProtocolVC?
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var opacity: CGFloat = 1
    
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet private weak var redTF: UITextField!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var greenTF: UITextField!
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var blueTF: UITextField!
    @IBOutlet private weak var opacitySlider: UISlider!
    @IBOutlet private weak var opacityTF: UITextField!
    
    //MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNewColor()
}
    
    //MARK: - Methods
    
    @IBAction func saveButton() {
        delegate?.update(color: colorView.backgroundColor)
        delegate?.updateSlider(red: red, green: green, blue: blue)
        navigationController?.popToRootViewController(animated: true)
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
    
    @IBAction func opacitySliderAction(_ sender: Any) {
        opacityTF.text = String(opacitySlider.value)
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
              let blueText = blueTF.text,
              let opacityText = opacityTF.text
        else { return }
        if let redValue = Float(redText) {
            if redValue > 1 { redSlider.value = 1.0 }
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
        if let opacityValue = Float(opacityText) {
            if opacityValue > 1 {opacitySlider.value = 1.0 }
            else { opacitySlider.value = opacityValue }
        }
    }

    func updateNewColor() {
        self.colorView.backgroundColor = newColor
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        redTF.text = String(redSlider.value)
        greenTF.text = String(greenSlider.value)
        blueTF.text = String(blueSlider.value)
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


