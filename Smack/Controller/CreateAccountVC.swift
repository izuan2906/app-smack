//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Izuan Ismail on 30/3/19.
//  Copyright © 2019 Da'ieMind. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func createAcctPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passTxt.text, passTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                //print("registered user!")
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("Logged in user!", AuthService.instance.authToken)
                    }
                })
            }
        }
    }

    @IBAction func pickAvatarPressed(_ sender: Any) {
    }

    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
