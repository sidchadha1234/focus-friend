import UIKit

class Break: UIViewController {
    
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var letsStudyButton: UIButton!
    
    var startstop: Bool = false
    
    var timer: Timer!
    
    let breakLength = StudyQuestionThree.FinalData.chosenBreak
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        startButton.layer.cornerRadius = 7.0
        letsStudyButton.layer.cornerRadius = 7.0
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
    
    @IBAction func studyTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toAnalytics", sender: self)
    }
    
    @objc func count () {
           var tempSeconds = Int(seconds.text!)!
           var tempMinutes = Int(minutes.text!)!

           if tempMinutes == 0 {
               timer.invalidate()
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
        minutes.text = String(breakLength)
        seconds.text = "00"
    }
}
