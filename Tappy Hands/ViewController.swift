//
//  ViewController.swift
//  Tappy Hands
//
//  Created by Ayush Verma on 31/05/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 10.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "record")
        
        if (value == nil){
        
            scoreLabel.text = "0"
        }
        else{
            scoreLabel.text = value
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

