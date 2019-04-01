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
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func createAcctPressed(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passTxt.text, passTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                //print("registered user!")
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        //print("Logged in user!", AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName, UserDataService.instance.avatarColor, UserDataService.instance.email, UserDataService.instance.id)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
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
