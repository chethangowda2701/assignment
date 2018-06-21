//
//  PDPCollectionViewControllerFactory.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/17/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import Foundation
import UIKit

struct PLPViewControllerFactory: ViewControllerFactory {
    let userName: String
    
    func make() -> PLPViewController {
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PLPViewController") as! PLPViewController
        controller.userName = self.userName
        return controller
    }
}
