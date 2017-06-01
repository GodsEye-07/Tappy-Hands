//
//  GameViewController.swift
//  Tappy Hands
//
//  Created by Ayush Verma on 01/06/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    // create a variable so that it initalizes the value to 0 by default
    
    var tapInt = 0
    var startInt = 3
    var startTimer = Timer()
    
    var gameInt = 10
    var gameTimer = Timer()
    
    var recordData:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adds the little corning edges to the buttons
        
        button.layer.cornerRadius = 10.0
        
        tapInt = 0
        scoreLabel.text = String(tapInt)
        
        startInt = 3
        button.setTitle(String(startInt), for: .normal)
        button.isEnabled = false
        
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.startGameTimer), userInfo: nil, repeats: true)
        
        gameInt = 10
        timeLabel.text = String(gameInt)
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "record")
        
        recordData = value
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapMeButton(_ sender: Any) {
        
        tapInt += 1
        scoreLabel.text = String(tapInt)
        
    }
    
    func startGameTimer(){
        
        startInt -= 1
        button.setTitle(String(startInt), for: .normal)
        
        // condition that checks and stops the number from going beyond 0
        
        if startInt == 0{
            startTimer.invalidate()
            
            button.setTitle("Tap Me", for: .normal)
            
            button.isEnabled = true
            
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.game), userInfo: nil, repeats: true)
           
        }
    }
    
    
    func game(){
    
            gameInt -= 1
            timeLabel.text = String(gameInt)
        if gameInt == 0{
            
            gameTimer.invalidate()
            
            
            if recordData == nil{
                
                let saveScore = scoreLabel.text
                let userDefaults = Foundation.UserDefaults.standard
                userDefaults.set(saveScore, forKey: "record")
            }
            else{
                
                let score:Int? = Int(scoreLabel.text!)
                let record:Int?  = Int(recordData)
                
                if score! > record!{
                
                    let saveScore = scoreLabel.text
                    let userDefaults = Foundation.UserDefaults.standard
                    userDefaults.set(saveScore, forKey: "record")
                
                }
                
            }
            
            
            
            button.isEnabled = false
            
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameViewController.ending), userInfo: nil, repeats: false)
        
        }
        
    }
    
    
    func ending(){
    
        // this line takes the vc to the the specific 3rd viewController in the storyBoard
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "endGame") as! EndGameViewController
        
        vc.scoreData = scoreLabel.text
        
        self.present(vc, animated: false, completion: nil)
    
    }
  
}
