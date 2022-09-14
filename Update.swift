import UIKit

class Update: UIViewController {
    
    struct Data {
        static var finalTime = String()
        static var finalBreak = String()
    }
    
    @IBOutlet weak var timeInput: UITextField!
    @IBOutlet weak var breakInput: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        timeInput.autocorrectionType = .no
        breakInput.autocorrectionType = .no
        
        enterButton.layer.cornerRadius = 7.0
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        let error = validateFields()

            if error != nil {
                showError(error: error!)
            }

            else {
                StudyQuestionThree.FinalData.chosenTime = Int(timeInput.text!.trimmingCharacters(in: .whitespacesAndNewlines))!
                StudyQuestionThree.FinalData.chosenBreak = Int(breakInput.text!.trimmingCharacters(in: .whitespacesAndNewlines))!

                self.performSegue(withIdentifier: "backToThree", sender: self)
            }
        }
        
    func validateFields() -> String? {
        if timeInput.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            breakInput.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return ("Please fill in all fields!")
        }

        return nil
    }

    func showError(error: String) {
        let alert = UIAlertController(title: "focusfriend", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
    }

    @objc func handleTap() {
        view.endEditing(true)
    }
}
