//
//  SampleCleanInteractor.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 25/06/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation

class SampleCleanInteractor: SampleCleanInteractorProtocol {
    var presenter: SampleCleanPresenterProtocol
    
    init(_ presenter: SampleCleanPresenterProtocol) {
        self.presenter = presenter
    }
    
    func onDidload() {
        presenter.presentOnDidload("Test Clean Swift")
    }
    
    func doLoginService(_ username: String?, _ password: String?) {
        //fetch anything here -> ex : do fetch API / anything services for login here
        presenter.presentLoginViewController(username, password)
    }
    
}
