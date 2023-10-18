//
//  ViewController.swift
//  GitHub API
//
//  Created by Prakhar Parakh on 17/10/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userNameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let followerVC = segue.destination as! FollowersViewController
        
        followerVC.userName = userNameField.text ?? ""
    }


}

