//
//  breatheTip.swift
//  focusfriend
//
//  Created by Jayanth Peetla on 7/23/20.
//  Copyright © 2020 Peetla. All rights reserved.
//

import UIKit

class breatheTip: UIViewController {

    @IBOutlet weak var breatheButton: UIButton!
    @IBOutlet weak var studyButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var noteTips: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light

        breatheButton.layer.cornerRadius = 7.0
        studyButton.layer.cornerRadius = 7.0
        otherButton.layer.cornerRadius = 7.0
        label.layer.cornerRadius = 7.0
    }
    
    @IBAction func breatheTapped(_ sender: Any) {
        label.text = "Breathing has proven to significantly increase productivity levels and effectively clear your mind.  Start by taking five long, deep breaths.  Focus on nothing else besides your breath.  After you feel like your mind is clear, resume your work."
    }
    
    @IBAction func studyTapped(_ sender: Any) {
        label.text = "Your study environment is essential to focusing.  If you believe that you are able to work better by yourself with no one near you, we recommend that you find an individual workspace in either your bedroom or office with good lighting.  If you find yourself easily distracted, we recommend that you find a silent workspace near a trusted family member or friend that can hold you accountable for your work."
    }
    
    @IBAction func noteTips(_ sender: Any) {
        label.text = "Don’t re-read the same notes more than 2-3 times. Psychological studies have found saying out loud or writing down the important important information you are studying improve retention significantly. You should also test yourself after studying all content."
    }
    
    @IBAction func otherTapped(_ sender: Any) {
        label.text = "One tip is to actively take notes on everything you are reading.  This both keeps you engaged in your studies and helps you remember material more effectively.  It's also recommended that you set goals for each study session.  Organize these goals in a short to-do list so you can easily visualize the tasks you have left to do."
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
