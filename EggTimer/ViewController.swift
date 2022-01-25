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
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    
    let eggHardness = ["Soft":30,"Medium":50,"Hard" :80] // Values we are calucating in seconds
    var timer = Timer()
    var timeLeft:Int = 0
    var totalTime:Int = 0
    var progressTime = 0
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        switch sender.currentTitle {
        case "Soft":
            timeLeft = eggHardness[sender.currentTitle!]!
            //print(timeLeft)
            totalTime = timeLeft
            setLabelString(selectedProcess: "Soft", timeLeft: timeLeft)
            startTimer()
        case "Medium":
            timeLeft = eggHardness[sender.currentTitle!]!
            totalTime = timeLeft
            setLabelString(selectedProcess: "Medium", timeLeft: timeLeft)
            startTimer()
        case "Hard":
            timeLeft = eggHardness[sender.currentTitle!]!
            totalTime = timeLeft
            setLabelString(selectedProcess: "Hard", timeLeft: timeLeft)
            startTimer()
        default:
            print("Nothing Clicked.")
        }
    }
    
    
    func setLabelString(selectedProcess :String, timeLeft:Int){
        textLabel.text = "\(selectedProcess) Boiled Selected,Processing Please wait for \(timeLeft) seconds. Your egg will be ready with yummy \(selectedProcess) boiled."
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
    
    @objc func updateTime(){
        if progressTime < totalTime {
            progressTime += 1
            print("Time Left Value is: \(timeLeft)")
            progressBar.progress = Float(progressTime)/Float(totalTime)
            timeLeft -= 1
        }else {
            timer.invalidate()
            //playsound.
            //update text
            playSound(soundName: "alarm_sound")
            textLabel.text = " Yoo ! Your fluffy eggs is ready to eat."
            print("Timer End.")
        }
       }
    
    func playSound(soundName:String) {
            let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
}
