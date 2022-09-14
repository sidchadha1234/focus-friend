import UIKit
import Firebase
import FirebaseFirestore

class QuestionOne: UIViewController {
    
    struct Data {
        static var MusicList = [String()]
        static var StudySettingList = [String()]
        static var OtherFactor = String()
        
        static var musicBoolean = false
        static var coloredPensBoolean = false
        static var studySettingBoolean = false
        static var noNearbyDevicesBoolean = false
        static var pacingBoolean = false
        static var otherBoolean = false
    }
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var coloredPensButton: UIButton!
    @IBOutlet weak var studySettingButton: UIButton!
    @IBOutlet weak var noNearbyDevicesButton: UIButton!
    @IBOutlet weak var pacingButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let darkGray: UIColor = .darkGray
    let lightGray: UIColor = .lightGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        musicButton.layer.cornerRadius = 7.0
        coloredPensButton.layer.cornerRadius = 7.0
        studySettingButton.layer.cornerRadius = 7.0
        noNearbyDevicesButton.layer.cornerRadius = 7.0
        pacingButton.layer.cornerRadius = 7.0
        otherButton.layer.cornerRadius = 7.0
        nextButton.layer.cornerRadius = 7.0
        
        if Data.musicBoolean == true {
            musicButton.backgroundColor = darkGray
        }
        
        if Data.coloredPensBoolean == true {
            coloredPensButton.backgroundColor = darkGray
        }
        
        if Data.studySettingBoolean == true {
            studySettingButton.backgroundColor = darkGray
        }
        
        if Data.noNearbyDevicesBoolean == true {
            noNearbyDevicesButton.backgroundColor = darkGray
        }
        
        if Data.pacingBoolean == true {
            pacingButton.backgroundColor = darkGray
        }
        
        if Data.otherBoolean == true {
            otherButton.backgroundColor = darkGray
        }
    }
    
    @IBAction func musicTapped(_ sender: Any) {
        if Data.musicBoolean == false {
            Data.musicBoolean = true
            musicButton.backgroundColor = .darkGray
            self.performSegue(withIdentifier: "toMusicDetails", sender: self)
        }
        
        else {
            Data.musicBoolean = false
            musicButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func coloredPensTapped(_ sender: Any) {
        if Data.coloredPensBoolean == false {
            Data.coloredPensBoolean = true
            coloredPensButton.backgroundColor = .darkGray
        }
        
        else {
            Data.coloredPensBoolean = false
            coloredPensButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func studySettingTapped(_ sender: Any) {
        if Data.studySettingBoolean == false {
            Data.studySettingBoolean = true
            studySettingButton.backgroundColor = .darkGray
            self.performSegue(withIdentifier: "toStudySettingDetails", sender: self)
        }
        
        else {
            Data.studySettingBoolean = false
            studySettingButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func noNearbyDevicesTapped(_ sender: Any) {
        if Data.noNearbyDevicesBoolean == false {
            Data.noNearbyDevicesBoolean = true
            noNearbyDevicesButton.backgroundColor = .darkGray
        }
        
        else {
            Data.noNearbyDevicesBoolean = false
            noNearbyDevicesButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func pacingTapped(_ sender: Any) {
        if Data.pacingBoolean == false {
            Data.pacingBoolean = true
            pacingButton.backgroundColor = .darkGray
        }
        
        else {
            Data.pacingBoolean = false
            pacingButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func otherTapped(_ sender: Any) {
        if Data.otherBoolean == false {
            Data.otherBoolean = true
            otherButton.backgroundColor = .darkGray
            self.performSegue(withIdentifier: "toOtherDetails", sender: self)
        }
        
        else {
            Data.otherBoolean = false
            otherButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        let cleanEmail = Email.Data.email
        
        let user = self.db.collection("factors").document(cleanEmail)
        user.setData(["music": Data.MusicList, "coloredPens": Data.coloredPensBoolean, "studySetting": Data.StudySettingList, "noNearbyDevices": Data.noNearbyDevicesBoolean, "constantPacing": Data.pacingBoolean, "other": Data.OtherFactor], merge: true)
        
        let user1 = self.db.collection("factors").document(cleanEmail)
        user1.setData(["musicBoolean": Data.musicBoolean, "coloredPensBoolean": Data.coloredPensBoolean, "studySettingBoolean": Data.studySettingBoolean, "noNearbyDevicesBoolean": Data.noNearbyDevicesBoolean, "constantPacingBoolean": Data.pacingBoolean, "otherBoolean": Data.otherBoolean], merge: true)
        
        self.performSegue(withIdentifier: "toThanks", sender: self)
    }
    
}
