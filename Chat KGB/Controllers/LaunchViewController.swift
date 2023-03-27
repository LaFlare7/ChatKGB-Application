//
//  LaunchViewController.swift
//  Chat KGB
//
//  Created by Mike on 17.03.2023.
//

import UIKit

class LaunchViewController: UIViewController {
    var timer = Timer()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(newVC),
                                     userInfo: nil,
                                     repeats: false)
    }
    @objc func newVC() {
        self.performSegue(withIdentifier: "AutorisationViewController", sender: nil)
        self.timer.invalidate()
    }
}
