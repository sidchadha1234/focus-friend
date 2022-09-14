import UIKit

class StudyQuestionThree: UIViewController {
    
    struct FinalData {
        static var chosenSubject = String()
        static var chosenSubjectIndex = Int()
        static var chosenTime = Int()
        static var chosenBreak = Int()
    }
    
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var breakLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        updateButton.layer.cornerRadius = 7.0
        startButton.layer.cornerRadius = 7.0
        
        let index = StudyQuestionTwo.Data.chosenSubjectIndex
        let chosenSubject = StudyQuestionTwo.Data.SubjectList[index]
        
        studyLabel.text = (StudyQuestionTwo.Data.finalTime[chosenSubject] as! String)
        breakLabel.text = (StudyQuestionTwo.Data.finalBreak[chosenSubject] as! String)
        
        let intTime = Int(StudyQuestionTwo.Data.finalTime[chosenSubject] as! String)
        let intBreak = Int(StudyQuestionTwo.Data.finalBreak[chosenSubject] as! String)
        
        FinalData.chosenSubjectIndex = index
        FinalData.chosenSubject = chosenSubject
        FinalData.chosenTime = intTime!
        FinalData.chosenBreak = intBreak!
    }
    
    @IBAction func updateTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toUpdate", sender: self)
    }
    
    @IBAction func startTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toTimer", sender: self)
    }
    
}
