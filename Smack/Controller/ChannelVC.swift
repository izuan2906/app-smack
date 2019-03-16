//
//  ChannelVC.swift
//  Smack
//
//  Created by Izuan Ismail on 16/3/19.
//  Copyright © 2019 Da'ieMind. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60

    }
}
