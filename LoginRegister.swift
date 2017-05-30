//
//  ViewController.swift
//  iEventosLPA
//
//  Created by Queralt Sosa Mompel on 26/5/17.
//  Copyright © 2017 Queralt Sosa Mompel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!

    
    // Registration code
    @IBAction func registrarseNuevo(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!, completion: {
            user, error in
            if error != nil {
                // no se puede registrar!
                let title = "Error"
                let message = "No se puede registrar"
                let okText = "OK"
                let alert = UIAlertController(title: title, message : message, preferredStyle: UIAlertControllerStyle.alert)
                let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okayButton)
                self.present(alert, animated: true, completion: nil)
                self.email.text = ""
                self.password.text = ""
            }  
            else {
                // OK
                self.performSegue(withIdentifier: "SegueToLogin", sender: self)
            }
        })
    }
    
    
    // Login code
    @IBAction func login(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailLogin.text!, password: passwordLogin.text!, completion: {
            user, error in
            if error != nil {
                let title = "No se ha podido iniciar sesión"
                let message = "Complete de nuevo los datos o regístrese en Eventos LPA"
                let okText = "OK"
                let alert = UIAlertController(title: title, message : message, preferredStyle: UIAlertControllerStyle.alert)
                let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okayButton)
                self.present(alert, animated: true, completion: nil)
                self.emailLogin.text = ""
                self.passwordLogin.text = ""
            }
            else {
                self.performSegue(withIdentifier: "SegueToTransition", sender: self)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
