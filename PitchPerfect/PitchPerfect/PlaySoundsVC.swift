//
//  PlaySoundsVC.swift
//  PitchPerfect
//
//  Created by Zoufishan Mehdi on 3/27/16.
//  Copyright © 2016 c4q. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsVC: UIViewController {
    
//    var audioPlayer:AVAudioPlayer!
//    var receivedAudio:RecordedAudio!
    
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var kangarooButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow = 0, Fast = 1, Chipmunk = 2, Vader = 3, Reverb = 5, Echo = 4}
   
        // Do any additional setup after loading the view.
        
//        do {
//            var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
//            var filePathUrl = NSURL.fileURLWithPath(filePath!)
//           try audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl)
//            audioPlayer.enableRate = true
//        } catch {
//            print("Error is \(error)")
//           // return nil
//        }
//        
//        do {
//            try audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
//            audioPlayer.enableRate = true
//        } catch {
//            print("Error is \(error)")
//        }
//    }
//    

    @IBAction func playButtonPressed(sender: AnyObject) {
        print("play sound button pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        
        configureUI(.Playing)
    }
    
    
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("stop sound button pressed")
    }
    
    
    
    var recordedAudio: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupAudio() 

    }

    override func viewWillAppear(animated: Bool) {
        
        configureUI(.NotPlaying)
        
    }

}
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/
