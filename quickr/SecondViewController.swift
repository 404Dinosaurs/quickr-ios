//
//  SecondViewController.swift
//  quickr
//
//  Created by Sharma, Sharma on 7/14/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet private weak var firstNameButton: UILabel!
    
    @IBOutlet private weak var lastNamelabel: UILabel!
    
    func setup(firstName: String, lastName: String){
        firstNameButton.text = firstName
        lastNamelabel.text = lastName
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
