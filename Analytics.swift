import UIKit
import Firebase
import FirebaseFirestore

class Analytics: UIViewController {
    
    struct Data {
        static var myEmail = Email.Data.email
        static var SubjectList = [String()]
        static var CompletedSessionsList = [String()]
        static var TotalTimeList = [String()]
    }
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pointCount: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveSubjects()
        
        overrideUserInterfaceStyle = .light
        
        nextButton.layer.cornerRadius = 7.0
        homeButton.layer.cornerRadius = 7.0
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toActualAnalytics", sender: self)
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "fromAnalyticstoHome", sender: self)
    }
    
    func retrieveSubjects() {
        db.collection("users").document(Data.myEmail).getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                Data.SubjectList = dataDescription!["subjectArray"] as! [String]
                Data.CompletedSessionsList = dataDescription!["completedSessionsArray"] as! [String]
                Data.TotalTimeList = dataDescription!["totalTimeArray"] as! [String]
            }
            else {
                print("Document does not exist")
            }
        }
    }
}
