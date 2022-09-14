import UIKit

class No: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        nextButton.layer.cornerRadius = 7.0
        backButton.layer.cornerRadius = 7.0
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "fromNotoStudyQuestionTwo", sender: self)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
