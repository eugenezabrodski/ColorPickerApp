//
//  ViewController.swift
//  ColorPickerApp
//
//  Created by Евгений Забродский on 30.11.22.
//

import UIKit

protocol ProtocolVC {
    func update(color: UIColor?)
}

class ViewController: UIViewController {


    @IBOutlet var viewOutlet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToSecondVC(_ sender: UIButton) {
        let stor = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = stor.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        else { return }
        vc.delegate = self
        vc.newColor = self.view.backgroundColor
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: ProtocolVC {
    func update(color: UIColor?) {
        viewOutlet.backgroundColor = color
    }
}



