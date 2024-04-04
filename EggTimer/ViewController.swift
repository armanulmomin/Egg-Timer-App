//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTime = ["Soft":3, "Medium":4,"Hard":7]
    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func selectedHardness(_ sender: UIButton) {
        
        
        timer.invalidate()
    
        let hardness = sender.currentTitle!
        secondsRemaining = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    }
    
    @objc func updateTimer()
    {
        if secondsPassed < totalTime
        {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            
        } else
        {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
}
