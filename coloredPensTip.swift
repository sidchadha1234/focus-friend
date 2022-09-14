//
//  coloredPensTip.swift
//  focusfriend
//
//  Created by Jayanth Peetla on 7/23/20.
//  Copyright © 2020 Peetla. All rights reserved.
//

import UIKit

class coloredPensTip: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light

        button.layer.cornerRadius = 7.0
    }

    @IBAction func tap(_ sender: Any) {
        let url = URL(string: "https://www.amazon.com/Pilot-Retractable-Premium-Assorted-31294/dp/B001K9Z4II/ref=sxts_sxwds-bia-wc-p13n2_0?cv_ct_cx=g2+pens&dchild=1&keywords=g2+pens&pd_rd_i=B001K9Z4II&pd_rd_r=87a27709-493b-4a75-ba83-15a854d8485c&pd_rd_w=uHIqh&pd_rd_wg=4CAfl&pf_rd_p=13bf9bc7-d68d-44c3-9d2e-647020f56802&pf_rd_r=1BD3SN0FNQ4VGY8R2YMN&psc=1&qid=1595791022&sr=1-2-791c2399-d602-4248-afbb-8a79de2d236f")!
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
