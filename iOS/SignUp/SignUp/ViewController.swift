//
//  ViewController.swift
//  SignUp
//
//  Created by 이조은 on 2022/08/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
            
        self.id.text = UserInformation.shared.id
        self.pwd.text = ""
    }

}

