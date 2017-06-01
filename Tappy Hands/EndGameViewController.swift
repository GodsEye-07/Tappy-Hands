//
//  EndGameViewController.swift
//  Tappy Hands
//
//  Created by Ayush Verma on 01/06/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!

    var scoreData:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.layer.cornerRadius = 5.0
        label2.layer.cornerRadius = 5.0
        button1.layer.cornerRadius = 5.0
        button2.layer.cornerRadius = 5.0
        button3.layer.cornerRadius = 5.0
        button4.layer.cornerRadius = 5.0
        
        scoreLabel.text  = scoreData
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func restartGame(_ sender: Any) {
        
       presentingViewController?.dismiss(animated: false, completion: nil)
        presentingViewController?.dismiss(animated: false, completion: nil)
        
    }

   
}
