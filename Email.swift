import UIKit

class Email: UIViewController {
    
    struct Data {
        static var email = String()
    }
    
    @IBOutlet weak var emailIn: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        nextButton.layer.cornerRadius = 7.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            showError(error: error!)
        }
        
        else {
            let cleanEmail = emailIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Data.email = cleanEmail
            
            self.performSegue(withIdentifier: "toPassword", sender: self)
        }
    }
    
    func validateFields() -> String? {
        if emailIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return ("Please fill in all fields!")
        }
        
        return nil
    }
    
    func showError(error: String) {
        errorLabel.text = error
        errorLabel.alpha = 1
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
