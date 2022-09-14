import UIKit
import Firebase
import FirebaseFirestore

class StudyQuestionTwo: UIViewController{
    
    struct Data {
        static var myEmail = Email.Data.email
        static var SubjectList = StudyQuestionOne.Data.SubjectList
        static var TimeList = StudyQuestionOne.Data.TimeList
        static var BreakList = StudyQuestionOne.Data.BreakList
        static var finalTime = Dictionary<String, Any>()
        static var finalBreak = Dictionary<String, Any>()
        static var chosenSubjectIndex = Int()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(StudyQuestionOne.Data.SubjectList)
        
        overrideUserInterfaceStyle = .light
        
        nextButton.layer.cornerRadius = 7.0
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mapSubjecttoTimeBreak()
        
        let nib = SubjectCell.nib()
        tableView.register(nib, forCellReuseIdentifier: "SubjectCell")
        tableView.rowHeight = 40.0
    }
    
    func mapSubjecttoTimeBreak() {
        if Data.SubjectList[0] == "" {
            Data.SubjectList.remove(at: 0)
        }
        
        if Data.TimeList[0] == "" {
            Data.TimeList.remove(at: 0)
        }
        
        if Data.BreakList[0] == "" {
            Data.BreakList.remove(at: 0)
        }
        
        for (index, item) in Data.TimeList.enumerated() {
            let actualIndex = Data.SubjectList[index]
            Data.finalTime[actualIndex] = item
        }
        
        for (index, item) in Data.BreakList.enumerated() {
            let actualIndex = Data.SubjectList[index]
            Data.finalBreak[actualIndex] = item
        }
    }

    @IBAction func nextTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toStudyQuestionThree", sender: self)
    }
}

extension StudyQuestionTwo: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.SubjectList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        cell.label.text = Data.SubjectList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Data.chosenSubjectIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        cell.background.backgroundColor = .lightGray
    }
}

