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
    }

    func calculateAreaAndPerimeter() {
        guard let width = widthTextField.text, let height = heightTextField.text else { return } // notify the user to enter a value
        guard let widthDouble = Double(width), let heightDouble = Double(height) else { return } // notify the user to enter a number

        let area = widthDouble * heightDouble
        let perimeter = (widthDouble * 2) + (heightDouble * 2)
        areaLabel.text = "\(area)"
        perimeterLabel.text = "\(perimeter)"

    }
}

