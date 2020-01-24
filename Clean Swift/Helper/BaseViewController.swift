//
//  BaseViewController.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 12/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func showActivityIndicator() {
        container.frame = self.view.frame
        container.center = self.view.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff)
        
        loadingView.frame = CGRect.init(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = self.view.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint.init(x: loadingView.frame.size.width / 2, y:  loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        self.view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    func UIColorFromHex(rgbValue: UInt32, _ alpha: Double = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    func popToViewController<T: UIViewController>(_ : T.Type) {
        guard let viewControllers = self.navigationController?.viewControllers else {
            return
        }
        
        for firstViewController in viewControllers {
            if let vc = firstViewController as? T {
                self.navigationController?.popToViewController(vc, animated: true)
                return
            }
        }
    }
    
    func showAlertError(type: AlertType, _ message: String) {
        let alert = UIAlertController(
            title: type.rawValue,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        ))
        
        self.present(
            alert,
            animated: true,
            completion: nil
        )
    }
    
    func showAlertWithHandler(_ titleAlert: String,
                              _ titleBtnRight: String,
                              _ message: String,
                              buttonRightAction: @escaping () -> Void ) {
        
        let alert = UIAlertController(
            title: titleAlert,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: UIAlertActionStyle.default,
            handler: nil
        ))
    
        alert.addAction(UIAlertAction(title: titleBtnRight, style: UIAlertActionStyle.default, handler: { (_) in
            buttonRightAction()
        }))
        
        self.present(
            alert,
            animated: true,
            completion: nil
        )
    }
    
    func showSimpleActionSheet() {
        /*
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Approve", style: .default, handler: { (_) in
            print("User click Approve button")
        }))
        
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (_) in
            print("User click Edit button")
        }))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
            print("User click Delete button")
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        
        self.present(
            alert,
            animated: true,
            completion: nil
        )
        */
    }
    
    func getCurrentDate(_ withFormat: String = "yyyy-MM-dd'T'HH:mm:ss") -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = withFormat
        return dateFormat.string(from: Date())
    }
    
    func changeformatDate(stringDate: String, _ currentFormat: String = "yyyy-MM-dd'T'HH:mm:ss",
                          _ resultFormat: String = "dd MMM YYYY") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentFormat
        let date = dateFormatter.date(from: stringDate)
        
        dateFormatter.dateFormat = resultFormat
        let resultDate = dateFormatter.string(from: date!)
        
        return resultDate
    }
    
    func openFile(urlString: String) {
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}

extension UIImageView {
    func makeRoundedWithBorder() {
        let radius = self.frame.width/2.0
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

enum AlertType: String {
    case error = "Error"
    case success = "Success"
}
