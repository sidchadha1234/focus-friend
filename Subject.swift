import UIKit
import Firebase
import FirebaseFirestore

class Subject: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list = ["String", "Yes", "no"]
    
    struct Data {
        static var mySubjects = [String()]
        static var myTimes = Array<String>()
        static var myBreaks = Array<String>()
        static var myCompletedSessions = Array<String>()
        static var myTotalTime = Array<String>()
    }
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Data.mySubjects)
        
        overrideUserInterfaceStyle = .light
        
        addButton.layer.cornerRadius = 7.0
        nextButton.layer.cornerRadius = 7.0
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toAddSubjects", sender: self)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            showError(error: error!)
        }
        
        else {
            let cleanEmail = Email.Data.email
            
            for _ in Data.mySubjects {
                Data.myCompletedSessions.append("0")
                Data.myTotalTime.append("0")
            }
            
            let user = self.db.collection("users").document(cleanEmail)
            user.setData(["subjectArray": Data.mySubjects, "timeArray": Data.myTimes, "breakArray": Data.myBreaks, "completedSessionsArray": Data.myCompletedSessions, "totalTimeArray": Data.myTotalTime], merge: true)
            
            self.performSegue(withIdentifier: "toQuestionOne", sender: self)
        }
    }
    
    func validateFields() -> String? {
        if Data.mySubjects.count == 1 ||
            Data.myTimes.count == 1 ||
        Data.myBreaks.count == 1 {
            return ("Please enter atleast one subject for us to provide statistics upon!")
        }
        
        return nil
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "focusfriend", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
    }
}

extension Subject: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.mySubjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label?.text = Data.mySubjects[indexPath.row]
        return cell
    }
}
