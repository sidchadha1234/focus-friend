import UIKit
import Firebase
import FirebaseFirestore

class StudyQuestionOne: UIViewController {
    
    struct Data {
        static var myEmail = Email.Data.email
        static var SubjectList = [String()]
        static var TimeList = [String()]
        static var BreakList = [String()]
    }
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        yesButton.layer.cornerRadius = 7.0
        noButton.layer.cornerRadius = 7.0
        
        retrieveSubjects()
    }
    
    @IBAction func yesTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toStudyQuestionTwo", sender: self)
    }
    
    @IBAction func noTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toNo", sender: self)
    }
    
    func retrieveSubjects() {
        db.collection("users").document(Data.myEmail).getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                Data.SubjectList = dataDescription!["subjectArray"] as! [String]
                Data.TimeList = dataDescription!["timeArray"] as! [String]
                Data.BreakList = dataDescription!["breakArray"] as! [String]
            }
            else {
                print("Document does not exist")
            }
        }
    }
}
