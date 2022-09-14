import UIKit
import Firebase
import FirebaseFirestore

class Intro: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        label.alpha = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
        overrideUserInterfaceStyle = .light
        
        UIView.animate(withDuration: 1) {
            self.label.alpha = 1
        }
    }

    
    @objc func handleTap() {
        self.performSegue(withIdentifier: "toGreet", sender: self)
    }
}
