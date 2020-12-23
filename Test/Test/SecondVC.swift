//
//  SecondVC.swift
//  Test
//
//  Created by Manasa Marlingalar on 23/12/20.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet weak var label: UILabel!
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = name
    }
}
