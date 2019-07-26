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
            if let authResult = authResult {
                let user = authResult.user
                print("User has Signed In")
                if user.isEmailVerified {
                    print("User was logged")
                    self.performSegue(withIdentifier: "HomeVCSegue", sender: nil)
                } else {
                    print("User must check email and verify his account")
                }
            } else if error != nil {
                print("Error")
            }
        }
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: email.text!) { error in
            if error != nil {
                print ("Error")
            } else {
                print("Email was send")
            }
        }
    }
}
