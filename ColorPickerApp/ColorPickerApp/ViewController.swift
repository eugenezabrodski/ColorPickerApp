//
//  ViewController.swift
//  ColorPickerApp
//
//  Created by Евгений Забродский on 30.11.22.
//

import UIKit

protocol ProtocolVC {
    func update(color: UIColor?)
    func updateSlider(red: CGFloat, green: CGFloat, blue: CGFloat)
}


final class ViewController: UIViewController {
    
    var redValue: CGFloat = 0
    var greenValue: CGFloat = 0
    var blueValue: CGFloat = 0


    @IBOutlet private var viewOutlet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func goToSecondVC(_ sender: UIButton) {
        let stor = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = stor.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        else { return }
        vc.delegate = self
        vc.newColor = self.view.backgroundColor
        vc.red = redValue
        vc.green = greenValue
        vc.blue = blueValue
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: ProtocolVC {
    func update(color: UIColor?) {
        viewOutlet.backgroundColor = color
    }
    func updateSlider(red: CGFloat, green: CGFloat, blue: CGFloat) {
        redValue = red
        greenValue = green
        blueValue = blue
    }
    
}



