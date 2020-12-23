//
//  ForthVC.swift
//  Test
//
//  Created by Manasa Marlingalar on 23/12/20.
//

import UIKit

class ForthVC: UIViewController {
    var text = ""
    var name = ""
    
    var label = UILabel()
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        print(text)
        print(name)
        setupStyle()
        
        //notification observer
        NotificationCenter.default.addObserver(self, selector: #selector(printDataFromNotificationCenter(_:)), name: NSNotification.Name("pass data"), object: nil)
    }
    
    func setupStyle() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.text = "\(text) \n \(name)"
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func updateTitle(_ text: String) {
        title = text
    }
    
    @objc func printDataFromNotificationCenter(_ notification: Notification) {
        print(notification.userInfo?["userInfo"] as? [String: Any] ?? [:])
    }
    
    func callApi(completion: (String) -> Void) {
        completion("pass data by completion block")
    }
}


class Singleton {
    var title = "pass data by singleton"
    static let shared = Singleton()
    private init() {}
}
