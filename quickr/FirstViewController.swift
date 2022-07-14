//
//  ViewController.swift
//  quickr
//
//  Created by Sharma, Sharma on 7/14/22.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapScanButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
        
        
        let secondStoryboard = storyboard.instantiateViewController(withIdentifier: "second_controller") as! SecondViewController
        secondStoryboard.loadViewIfNeeded()
        secondStoryboard.view.backgroundColor = .systemMint
        secondStoryboard.setup(firstName: "Shubhang", lastName: "Sharma")
        self.present(secondStoryboard, animated: true, completion: nil)
    }
    
}

