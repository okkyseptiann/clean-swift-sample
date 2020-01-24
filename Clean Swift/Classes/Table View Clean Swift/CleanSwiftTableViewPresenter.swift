//
//  CleanSwiftTableViewPresenter.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 12/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation
import UIKit

class CleanSwiftTableViewPresenter: CleanSwiftTableViewPresenterProtocol {
    var viewController : CleanSwiftTableViewControllerProtocol?
    
    func presentData(_ param: [String]) {
        //fill data to screen data (View Model)
        var screenData = ScreenData()
        screenData.rowSize = param.count
        screenData.listSample = param
        viewController?.displayData(screenData)
    }
}
