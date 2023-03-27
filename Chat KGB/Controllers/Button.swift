//
//  Button.swift
//  Chat KGB
//
//  Created by Mike on 17.03.2023.
//

import UIKit

class Button: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = false
        layer.cornerRadius = 30.0
        pulsate()
    }
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.duration = 0.15
        pulse.autoreverses = false
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 0.15
        layer.add(pulse, forKey: "transform.scale")
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.fromValue = 1
        opacity.toValue = 0.5
        opacity.duration = 0.15
        layer.add(opacity, forKey: "opacity")
    }
    func buttonEnable() {
        isEnabled = true
        alpha = 1
    }
    func buttonDisable() {
        isEnabled = false
        alpha = 0.5
    }
}
