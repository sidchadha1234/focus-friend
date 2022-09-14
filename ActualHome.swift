import UIKit

class ActualHome: UIViewController {
    
    @IBOutlet weak var studyButton: UIButton!
    @IBOutlet weak var analyticsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        studyButton.layer.cornerRadius = 7.0
        analyticsButton.layer.cornerRadius = 7.0
    }
    
    @IBAction func studyTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toStudyQuestionOne", sender: self)
    }
    
    @IBAction func analyticsTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toAnalyticsTwo", sender: self)
    }
}
