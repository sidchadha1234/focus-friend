import UIKit

class Greet: UIViewController {
    
    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var logInLabel: UIButton!
    @IBOutlet weak var caption: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        signUpLabel.layer.cornerRadius = 7.0
        logInLabel.layer.cornerRadius = 7.0
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toName", sender: self)
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toLogIn", sender: self)
    }
    
}
