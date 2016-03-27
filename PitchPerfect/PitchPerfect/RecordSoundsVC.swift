//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Zoufishan Mehdi on 3/27/16.
//  Copyright © 2016 c4q. All rights reserved.
//

import UIKit

class RecordSoundsVC: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(sender: AnyObject) {
        print("Record button pressed")
        recordingLabel.text = "Recording in progress..."
        stopRecordingButton.enabled = true
        recordButton.enabled = false

    }
    
   
    @IBAction func stopRecording(sender: AnyObject) {
        print("Stop recording button pressed")
        recordButton.enabled = true
        stopRecordingButton.enabled = false
        recordingLabel.text = "Tap to Record"
    }
    
}

