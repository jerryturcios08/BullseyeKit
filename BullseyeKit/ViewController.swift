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
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

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
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference

        score += points

        let title: String

        // Checks the difference before modifying the title
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }

        let scoreMsg = points == 1 ? "\(points) point" : "\(points) points"
        let message = "You scored \(scoreMsg)"

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
        round += 1
        targetValue = Int.random(in: 1...100)

        currentValue = 50
        slider.value = Float(currentValue)

        updateLabels()
    }

    /// The updateLabels method updates the labels in the view.
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
