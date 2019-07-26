import UIKit
import Firebase

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deleteAccount(_ sender: Any) {
        let user = Auth.auth().currentUser
        user?.delete { error in
            if error != nil {
                print("Error")
            } else {
                self.performSegue(withIdentifier: "IndexVCSegue", sender: self)
            }
        }
    }
}
