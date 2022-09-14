
//  constantPacingTip.swift
//  focusfriend
//
//  Created by Jayanth Peetla on 7/23/20.
//  Copyright © 2020 Peetla. All rights reserved.
//

import UIKit

class constantPacingTip: UIViewController {
    
    @IBOutlet weak var chuchikButton: UIButton!
    @IBOutlet weak var scioneTapped: UIButton!
    @IBOutlet weak var honmofunTapped: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light

        chuchikButton.layer.cornerRadius = 7.0
        scioneTapped.layer.cornerRadius = 7.0
        honmofunTapped.layer.cornerRadius = 7.0
    }

    @IBAction func chuchikTapped(_ sender: Any) {
        let url = URL(string: "https://www.amazon.com/CHUCHIK-Fidget-Reduce-Anxiety-Stress/dp/B07KK8QLSQ/ref=sr_1_3_sspa?dchild=1&keywords=fidget+cube&qid=1595788199&s=toys-and-games&sr=1-3-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyTTJTWE9MNzFOVEREJmVuY3J5cHRlZElkPUEwOTE4MDE5MkxZOUhNUlMyTDNURCZlbmNyeXB0ZWRBZElkPUEwNzc2NjEwRElQUlhKNjczWjJHJndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==")!
        UIApplication.shared.open(url, options: [:]) { (error) in
            if error == true {
                return
            }
            else {
                let backupURL = URL(string: "https://www.amazon.com")!
                UIApplication.shared.open(backupURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    @IBAction func scioneTapped(_ sender: Any) {
        let url = URL(string: "https://www.amazon.com/Children-Trispinner-Fidgeting-Tri-Spinner-SCIONE/dp/B071KZS7H1/ref=sr_1_2?dchild=1&keywords=fidget+spinner&qid=1595788152&s=toys-and-games&sr=1-2")!
        UIApplication.shared.open(url, options: [:]) { (error) in
            if error == true {
                return
            }
            else {
                let backupURL = URL(string: "https://www.amazon.com")!
                UIApplication.shared.open(backupURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    @IBAction func honmofunTapped(_ sender: Any) {
        let url = URL(string: "https://www.amazon.com/Honmofun-Fidget-Twisty-Spinner-Keychain/dp/B07QZZKCCK/ref=sr_1_6?dchild=1&keywords=fidget+cube&qid=1595788215&s=toys-and-games&sr=1-6")!
        UIApplication.shared.open(url, options: [:]) { (error) in
            if error == true {
                return
            }
            else {
                let backupURL = URL(string: "https://www.amazon.com")!
                UIApplication.shared.open(backupURL, options: [:], completionHandler: nil)
            }
        }
    }
}
