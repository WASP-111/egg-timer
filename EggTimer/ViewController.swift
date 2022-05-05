//
//  ViewController.swift
//  EggTimer
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimer = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var audio:AVPlayer!
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimer[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            audio = AVPlayer.init(url: url!)
            
            audio.play()
           // audio.pause()
            
        }
    }
    
    
}
