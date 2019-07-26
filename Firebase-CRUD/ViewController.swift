import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { authResult, error in
            if error != nil {
                print("Error")
            } else {
                print("User was logged")
                self.performSegue(withIdentifier: "HomeVCSegue", sender: self)
            }
        }
    }
    
}

