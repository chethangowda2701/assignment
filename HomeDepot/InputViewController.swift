//
//  InputViewController.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/20/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.layer.borderWidth = 2
        self.userName.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }


    @IBAction func fetchRecords(_ sender: Any) {
        guard let userName = self.userName.text, !userName.isEmpty else { return }
        let controller = PLPViewControllerFactory(userName: userName).make()
        self.show(controller, sender: self)
    }
    
}
