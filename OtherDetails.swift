import UIKit

class OtherDetails: UIViewController {
    
    struct Data {
        static var otherFactor = String()
    }
    
    @IBOutlet weak var factorTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        enterButton.layer.cornerRadius = 7.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        if factorTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            Data.otherFactor = factorTextField.text!
        }
        QuestionOne.Data.OtherFactor = Data.otherFactor
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
