//
//  CleanSwiftTableViewInteractor.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 12/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation

class CleanSwiftTableViewInteractor: CleanSwiftTableViewInteractorProtocol {
    var presenter: CleanSwiftTableViewPresenterProtocol?
    
    init(_ presenter: CleanSwiftTableViewPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchData() {
        TableService.getLogin(["param1" : "param2"]) { (json) in
            self.presenter?.presentData(json.first_name ?? [])
        }
    }
}
