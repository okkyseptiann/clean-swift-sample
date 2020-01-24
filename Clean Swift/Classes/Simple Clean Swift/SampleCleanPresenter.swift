//
//  SampleCleanPresenter.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 25/06/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation

class SampleCleanPresenter: SampleCleanPresenterProtocol {
    var viewController : SampleCleanViewControllerProtocol?
    
    func presentOnDidload(_ param: String?) {
        var screenData = ScreenData()
        screenData.passwordDefault = "userName"
        screenData.userNameDefault = "password"
        viewController?.displayOnDidload(screenData)
    }
    
    func presentLoginViewController(_ username: String?, _ password: String?) {
        viewController?.displayLoginViewController("\(username!) & \(password!)")
    }
}
