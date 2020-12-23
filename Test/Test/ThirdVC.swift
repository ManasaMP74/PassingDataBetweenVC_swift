//
//  ThirdVC.swift
//  Test
//
//  Created by Manasa Marlingalar on 23/12/20.
//

import UIKit

protocol ThirdVCDelegate: class {
    func changeBackgroundColorFromVC(_ vc: ThirdVC, color: UIColor)
}

class ThirdVC: UIViewController {
    var name = ""
    weak var delegate: ThirdVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    @IBAction func changeBackground(_ sender: Any) {
        delegate?.changeBackgroundColorFromVC(self, color: UIColor.blue)
        navigationController?.popViewController(animated: true)
    }
}
