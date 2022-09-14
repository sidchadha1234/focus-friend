//
//  noNearbyDeviceTip.swift
//  focusfriend
//
//  Created by Jayanth Peetla on 7/23/20.
//  Copyright © 2020 Peetla. All rights reserved.
//

import UIKit

class noNearbyDeviceTip: UIViewController {

    @IBOutlet weak var button: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        button.layer.cornerRadius = 7.0

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.goToSettings))
        button.addGestureRecognizer(tap)
    }


    @objc func goToSettings() {
        let application = UIApplication.shared
        
        application.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }

}
