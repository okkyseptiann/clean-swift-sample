//
//  CleanSwiftTableViewController.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 12/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation
import UIKit

class CleanSwiftTableViewController: BaseViewController {
    @IBOutlet weak var mTableView: UITableView!
    var interactor: CleanSwiftTableViewInteractorProtocol?
    var screenData = ScreenData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        setupConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        interactor?.fetchData()
    }
    
    func initTableView() {
        mTableView.delegate = self
        mTableView.dataSource = self
    }
}

extension CleanSwiftTableViewController: UITableViewDataSource, UITableViewDelegate {
    // TABLE VIEW DATA SOURCE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screenData.rowSize ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return screenData.sectionSize
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = screenData.listSample[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath.row == 3 ?
            self.popToViewController(SampleCleanViewController.self) :
            self.showAlertError(type: AlertType.success, "Row Number \(indexPath.row)")
    }
}

extension CleanSwiftTableViewController: CleanSwiftTableViewControllerProtocol {
    func displayData(_ param: ScreenData) {
        screenData = param
        mTableView.reloadData()
    }
    
    func setupConfiguration() {
        let presenter = CleanSwiftTableViewPresenter()
        let interactor = CleanSwiftTableViewInteractor(presenter)
        presenter.viewController = self
        self.interactor = interactor
    }
}
