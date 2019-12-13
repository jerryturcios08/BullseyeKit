//
//  ViewController.swift
//  BullseyeKit
//
//  Created by Jerry Turcios on 12/12/19.
//  Copyright © 2019 Jerry Turcios. All rights reserved.
//

import UIKit

/// The ViewController is an object that handles the application logic. It extends the properties of
/// UIViewController and contains controls and labels for the application's user interface.
///
/// - Author: Jerry Turcios
/// - Version: 0.1
/// - Since: December 12th, 2019
class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    /// The viewDidLoad method overrides the base respective method from UIViewController. The
    /// method runs code when the view loads. The slider's value is rounded, and the value is used to
    /// initialize the currentValue variable. The startNewRound method is also called.
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }

    /// The showAlert method initializes the properties needed for an alert such as the message, title, and
    /// the style of the alert box. The alert is then displayed, and a new round is created.
    @IBAction func showAlert() {
        let message = "The value of the slider is now: \(currentValue)" +
            "\nThe target value is: \(targetValue)"

        let alert = UIAlertController(
            title: "Ok",
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: "Awesome!", style: .default, handler: nil
        )

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }

    /// The sliderMoved method rounds the slider's value and assigns that number to the current value.
    ///
    /// - Parameter slider: The bull's eye slider
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }

    /// The startNewRound method initializes a new round by randomly generating a new target value.
    /// The UI labels are also updated.
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }

    /// The updateLabels method updates the labels in the view.
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}
