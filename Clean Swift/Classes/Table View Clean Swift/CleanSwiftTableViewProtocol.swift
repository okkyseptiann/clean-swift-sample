//
//  CleanSwiftTableViewProtocol.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 12/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation

protocol CleanSwiftTableViewInteractorProtocol {
    func fetchData()
}

protocol CleanSwiftTableViewControllerProtocol {
    func displayData(_ param: ScreenData)
}

protocol CleanSwiftTableViewPresenterProtocol {
    func presentData(_ param: [String])
}
