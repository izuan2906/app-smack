//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Izuan Ismail on 30/3/19.
//  Copyright © 2019 Da'ieMind. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
