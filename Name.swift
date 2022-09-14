import UIKit
import Firebase
import FirebaseFirestore

class Name: UIViewController {
    
    struct Data {
        static var firstName = String()
        static var lastName = String()
    }
    
    @IBOutlet weak var firstNameIn: UITextField!
    @IBOutlet weak var lastNameIn: UITextField!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        goButton.layer.cornerRadius = 7.0
        
        firstNameIn.autocorrectionType = .no
        lastNameIn.autocorrectionType = .no
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }

    @IBAction func goTapped(_ sender: Any) {
        let error = validateFields()

        if error != nil {
            showError(error: error!)
        }

        else {
            let cleanFirstName = firstNameIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanLastName = lastNameIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Data.firstName = cleanFirstName
            Data.lastName = cleanLastName

            self.performSegue(withIdentifier: "toEmail", sender: self)
        }
    }
    
    func validateFields() -> String? {
        if firstNameIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
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
