//
//  musicTip.swift
//  focusfriend
//
//  Created by Jayanth Peetla on 7/23/20.
//  Copyright © 2020 Peetla. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class MusicTip: UIViewController {
    
    let db = Firestore.firestore()
    
    var MusicList = [String()]
    
    var hipHopURL = "https://open.spotify.com/playlist/37i9dQZF1DX0XUsuxWHRQd"
    var popURL = "https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M"
    var countryURL = "https://open.spotify.com/playlist/6nU0t33tQA2i0qTI5HiyRV"
    var jazzURL = "https://open.spotify.com/playlist/37i9dQZF1DXbITWG1ZJKYt"
    var rockURL = "https://open.spotify.com/playlist/37i9dQZF1DWXRqgorJj26U"
    var metalURL = "https://open.spotify.com/playlist/37i9dQZF1DX5J7FIl4q56G"
    var classicalURL = "https://open.spotify.com/playlist/37i9dQZF1DWWEJlAGA9gs0"
    
    var finalURL = "https://www.spotify.com"

//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        loadMusic()
        
//        button.layer.cornerRadius = 7.0
//
//        let nib = MusicCell.nib()
//        tableView.register(nib, forCellReuseIdentifier: "MusicCell")
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.rowHeight = 40.0
    }
    
    func loadMusic() {
        db.collection("factors").document(StudyQuestionOne.Data.myEmail).getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                self.MusicList = dataDescription!["music"] as! [String]
                print(self.MusicList)
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
//    @IBAction func buttontapped(_ sender: Any) {
//        let url = URL(string: finalURL)!
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
}

//extension musicTip: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return MusicList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
//        cell.label.text = MusicList[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let text = MusicList[indexPath.row]
//
//        if text == "Hip Hop" {
//            finalURL = hipHopURL
//        }
//
//        if text == "Pop" {
//            finalURL = popURL
//        }
//
//        if text == "Classical" {
//            finalURL = classicalURL
//        }
//
//        if text == "Rock" {
//            finalURL = rockURL
//        }
//
//        if text == "Jazz" {
//            finalURL = jazzURL
//        }
//
//        if text == "Metal" {
//            finalURL = metalURL
//        }
//
//        if text == "Country" {
//            finalURL = countryURL
//        }
//    }
//}
