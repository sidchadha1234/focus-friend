import UIKit
import Firebase
import FirebaseFirestore

class TimerClass: UIViewController {
    
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var tipsButton: UIButton!
    
    let db = Firestore.firestore()
    
    var completedSessionsList = [""]
    var totalTimeList = [""]
    
    var totalTime = 0
    
    var startstop: Bool = false
    
    var timer: Timer!
    
    let timeLength = StudyQuestionThree.FinalData.chosenTime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        startButton.layer.cornerRadius = 7.0
        tipsButton.layer.cornerRadius = 7.0
        
        minutes.text = String(timeLength)
    }
    
    @IBAction func breakTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toBreak", sender: self)
    }
    
    @IBAction func startTapped(_ sender: Any) {
        if startstop == false {
            startstop = true
            
            startButton.backgroundColor = .systemRed
            startButton.setTitle("stop", for: .normal)
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.count), userInfo: nil, repeats: true)
        }
        
        else {
            startstop = false
            
            reset()
            
            startButton.backgroundColor = .systemTeal
            startButton.setTitle("start", for: .normal)
        }
    }
    
    @IBAction func tipsTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toTips", sender: self)
    }
    
    @IBAction func notificationsTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    @objc func count () {
        var tempSeconds = Int(seconds.text!)!
        var tempMinutes = Int(minutes.text!)!

        if tempMinutes == 0 && tempSeconds == 0 {
            timer.invalidate()
            
            db.collection("users").document(Email.Data.email).getDocument { (document, error) in
                if let document = document, document.exists {
                    let dataDescription = document.data()
                    self.completedSessionsList = dataDescription!["completedSessionsArray"] as! [String]
                    self.totalTimeList = dataDescription!["totalTimeArray"] as! [String]
                }
                else {
                    print("Document does not exist")
                }
            }
            
            var temp1: Int = Int(completedSessionsList[StudyQuestionThree.FinalData.chosenSubjectIndex])!
            temp1 += 1
            completedSessionsList[StudyQuestionThree.FinalData.chosenSubjectIndex] = String(temp1)
            
            var temp2: Int = Int(completedSessionsList[StudyQuestionThree.FinalData.chosenSubjectIndex])!
            temp2 += timeLength
            completedSessionsList[StudyQuestionThree.FinalData.chosenSubjectIndex] = String(temp2)
            
            self.performSegue(withIdentifier: "toBreak", sender: self)
        }
            
        else if tempMinutes < 10 {
            minutes.text = "0" + String(tempMinutes)
        }

        if tempSeconds == 0 {
            tempMinutes -= 1
            tempSeconds = 59

            minutes.text = String(tempMinutes)
            seconds.text = String(tempSeconds)
        }

        else if tempSeconds != 0 {
            if tempSeconds < 10 {
                tempSeconds -= 1
                seconds.text = "0" + String(tempSeconds)
            }
            
            else {
                tempSeconds -= 1
                seconds.text = String(tempSeconds)
            }
        }
    }

    func reset() {
        timer.invalidate()
        minutes.text = String(timeLength)
        seconds.text = "00"
    }
}
