import UIKit
import Firebase

class LogIn: UIViewController {
    
    @IBOutlet weak var emailIn: UITextField!
    @IBOutlet weak var passwordIn: UITextField!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        goButton.layer.cornerRadius = 7.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func goTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            showError(error: error!)
        }
        
        else {
            let cleanEmail = emailIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanPassword = passwordIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: cleanEmail, password: cleanPassword) { (result, error) in
                if error != nil {
                    self.showError(error: error!.localizedDescription)
                }
                
                else {
                    Email.Data.email = cleanEmail
                    self.performSegue(withIdentifier: "toHome2", sender: self)
                }
            }
        }
    }
    
    func validateFields() -> String? {
        if emailIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
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
