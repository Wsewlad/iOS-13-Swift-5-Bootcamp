//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime: [String : Int] = ["Soft" : 5, "Medium" : 8, "Hard" : 12]
    var secondsPassed = 0
    var totalTime = 0
    var timer: Timer?
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let hardness: String = sender.currentTitle, let time = eggTime[hardness] {
            totalTime = time
            secondsPassed = 0
            titleLabel.text = hardness
            if let t = timer {
                t.invalidate()
            }
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        }
        else {
            print("Error")
        }
    }

    @objc func update() {
        if (secondsPassed < totalTime) {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBarView.progress = percentageProgress
        } else {
            timer?.invalidate()
            playSound(soundName: "alarm_sound")
            titleLabel.text = "Done!"
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
