import UIKit

class ActualAnalytics: UIViewController {
    
    struct Data {
        static var myEmail = Email.Data.email
        static var SubjectList = Analytics.Data.SubjectList
        static var CompletedSessionsList = Analytics.Data.CompletedSessionsList
        static var TotalTimeList = Analytics.Data.TotalTimeList
        static var finalCompletedSessions = Dictionary<String, Any>()
        static var finalTotalTime = Dictionary<String, Any>()
        static var chosenSubjectIndex = Int()
        static var chosenSubject = String()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var completeSessions: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapSubjecttoTimeBreak()
        
        overrideUserInterfaceStyle = .light
        
        let nib = Cell.nib()
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 40.0
    }
    
    func mapSubjecttoTimeBreak() {
        if Data.SubjectList[0] == "" {
            Data.SubjectList.remove(at: 0)
        }

        if Data.CompletedSessionsList[0] == "" {
            Data.CompletedSessionsList.remove(at: 0)
        }

        if Data.TotalTimeList[0] == "" {
            Data.TotalTimeList.remove(at: 0)
        }

        for (index, item) in Data.CompletedSessionsList.enumerated() {
            let actualIndex = Data.SubjectList[index]
            Data.finalCompletedSessions[actualIndex] = item
        }

        for (index, item) in Data.TotalTimeList.enumerated() {
            let actualIndex = Data.SubjectList[index]
            Data.finalTotalTime[actualIndex] = item
        }
    }
}

extension ActualAnalytics: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.SubjectList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.label.text = Data.SubjectList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Data.chosenSubjectIndex = indexPath.row
        Data.chosenSubject = Data.SubjectList[Data.chosenSubjectIndex]
        completeSessions.text = (Data.finalCompletedSessions[Data.chosenSubject] as! String)
        totalTime.text = (Data.finalTotalTime[Data.chosenSubject] as! String)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.background.backgroundColor = .lightGray
    }
}
