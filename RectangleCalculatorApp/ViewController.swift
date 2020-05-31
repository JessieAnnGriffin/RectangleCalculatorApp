//
//  ViewController.swift
//  RectangleCalculatorApp
//
//  Created by Jessie Ann Griffin on 5/24/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var perimeterLabel: UILabel!

    @IBOutlet var keyboardDismissTapGesture: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.heightTextField.delegate = self
        self.widthTextField.delegate = self
        keyboardDismissTapGesture.addTarget(self, action: #selector(ViewController.dismissKeyboard))
    }

    func calculateAreaAndPerimeter() {
        guard let width = Double(widthTextField.text!), let height = Double(heightTextField.text!) else { return }

        let area = width * height
        let perimeter = (width * 2) + (height * 2)

        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = .decimal
        decimalFormatter.usesGroupingSeparator = true
        decimalFormatter.groupingSeparator = ","
        decimalFormatter.alwaysShowsDecimalSeparator = true
        decimalFormatter.minimumFractionDigits = 2
        decimalFormatter.maximumFractionDigits = 2

        areaLabel.text = decimalFormatter.string(from: NSNumber(value: area))
        perimeterLabel.text = decimalFormatter.string(from: NSNumber(value: perimeter))
    }

    @objc func dismissKeyboard() {
        self.view.addGestureRecognizer(keyboardDismissTapGesture)
        calculateAreaAndPerimeter()
    }
}

extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.clearsOnBeginEditing = true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if ((textField.text?.components(separatedBy: ".").count)! > 1 && string == ".")
        {
            return false
        }
        return string == "" || (string == "." || Float(string) != nil)
    }
}
