//
//  ViewControllerFacotry.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import Foundation

public protocol ViewControllerFactory {
    associatedtype ViewController
    func make() -> ViewController
}
