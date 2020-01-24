//
//  SampleCleanViewController.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 25/06/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import UIKit

class SampleCleanViewController: BaseViewController {
    var interactor: SampleCleanInteractorProtocol?
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfiguration()
        interactor?.onDidload()
    }
    
    @IBAction func onDidLogin(_ sender: Any) {
        interactor?.doLoginService(usernameField.text, passwordField.text)
    }
    
    func setupConfiguration() {
        let presenter = SampleCleanPresenter()
        let interactor = SampleCleanInteractor(presenter)
        presenter.viewController = self
        self.interactor = interactor
    }
}

extension SampleCleanViewController: SampleCleanViewControllerProtocol {
    
    func displayOnDidload(_ param: ScreenData) {
        usernameField.text = param.userNameDefault
        passwordField.text = param.passwordDefault
    }
    
    func displayLoginViewController(_ param: String?) {
        let vc = UIStoryboard.init(name: "SampleClean", bundle:nil ).instantiateViewController(withIdentifier: "CleanSwiftTableViewController") as? CleanSwiftTableViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
