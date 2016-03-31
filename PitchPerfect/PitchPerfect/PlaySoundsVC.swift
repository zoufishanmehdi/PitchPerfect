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
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    //var recordedAudio: NSURL
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var kangarooButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
            audioPlayer.enableRate = true
        } catch {
            print("Error is \(error)")
        }
    }
    

    @IBAction func playButtonPressed(sender: AnyObject) {
        print("play sound button pressed")
    }
    
    
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("stop sound button pressed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
