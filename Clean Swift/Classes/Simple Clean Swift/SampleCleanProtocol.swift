//
//  SampleCleanProtocol.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 25/06/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation

protocol SampleCleanInteractorProtocol {
    func onDidload()
    func doLoginService(_ username: String?, _ password: String?)
}

protocol SampleCleanViewControllerProtocol {
    func displayOnDidload(_ param: ScreenData)
    func displayLoginViewController(_ param: String?)
}

protocol SampleCleanPresenterProtocol {
    func presentOnDidload(_ param: String?)
    func presentLoginViewController(_ username: String?, _ password: String?)
}
