import UIKit
import Firebase
import FirebaseFirestore

class Password: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var passIn: UITextField!
    @IBOutlet weak var letsGo: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        letsGo.layer.cornerRadius = 7.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func letsGoTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            showError(error: error!)
        }
        
        else {
            let cleanEmail = Email.Data.email
            let cleanPassword = passIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
            Auth.auth().createUser(withEmail: cleanEmail, password: cleanPassword) { (result, err) in
                if err != nil {
                    print("There was an error in creating your account.")
                }
        
                else {
                    let user = self.db.collection("users").document(cleanEmail)
                    user.setData(["firstName": Name.Data.firstName, "lastName": Name.Data.lastName, "email": Email.Data.email])
                    
                    self.performSegue(withIdentifier: "toHome", sender: self)
                }
            }
        }
    }
    
    
    func validateFields() -> String? {
        if passIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
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
