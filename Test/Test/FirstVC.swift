//
//  ViewController.swift
//  Test
//
//  Created by Manasa Marlingalar on 23/12/20.
//

import UIKit

class FirstVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    //pass data by init method
    let vc = ForthVC(name: "Data from first vc in init method")

    override func viewDidLoad() {
        super.viewDidLoad()
        // pass data by using singleton
        title = Singleton.shared.title
        
        // pass data by using notification center.
        // added notification observer in reciever view controller i.e you can check the notification observer in forth view controller.
        let data = ["userInfo": ["name": "Varsha"]]
        NotificationCenter.default
            .post(name: NSNotification.Name("pass data"),
                  object: nil,
                  userInfo: data)
        
        // pass data by parameter
        vc.text = "pass data by parameter"
        
        // pass data by function
        vc.updateTitle("pass data by function")
        
        //pass data by completion block
        vc.callApi() {(message) in
            label.text = message
            print(message)
        }
    }
    
    @IBAction func pushThirdVC(_ sender: Any) {
        performSegue(withIdentifier: "thirdVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // pass data by using segue
        if segue.identifier == "secondVC",
           let vc = segue.destination as? SecondVC {
            vc.name = "data from first vc from segue"
        }else if segue.identifier == "thirdVC",
              let vc = segue.destination as? ThirdVC {
               vc.delegate = self
           }
    }
    
    @IBAction func pushFourthVC(_ sender: Any) {
        navigationController?.pushViewController(vc, animated: false)
    }
}

// pass data by delegate methods
extension FirstVC: ThirdVCDelegate {
    func changeBackgroundColorFromVC(_ vc: ThirdVC, color: UIColor) {
        view.backgroundColor = color
    }
}
