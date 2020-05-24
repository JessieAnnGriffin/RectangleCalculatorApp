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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.heightTextField.delegate = self
        self.widthTextField.delegate = self
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
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard Double(textField.text!) != nil else {
            let alert = UIAlertController(title: "", message: "Entry must be a decimal number", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(dismissAction)
            present(alert, animated: true)
            return true
        }

        if textField == heightTextField {
            textField.resignFirstResponder()
            calculateAreaAndPerimeter()
            return true
        } else {
            textField.resignFirstResponder()
            self.heightTextField.becomeFirstResponder()
            return true
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.clearsOnBeginEditing = true
    }
}
