//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Zoufishan Mehdi on 3/27/16.
//  Copyright © 2016 c4q. All rights reserved.
//

import UIKit
import AVFoundation
class RecordSoundsVC: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio: NSURL!
    //var recordedAudio:RecordedAudio!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.enabled = false
        
    }

    override func viewWillAppear(animated: Bool) {
        print("view will appear called")
        //stopRecordingButton.hidden = true
    }


    @IBAction func recordAudio(sender: AnyObject) {
        print("Record button pressed")
        recordingLabel.text = "Recording in progress..."
       // stopRecordingButton.hidden = true
        recordButton.enabled = false
        stopRecordingButton.enabled = true
        
       
//        let currentDateTime = NSDate()
//        let formatter = NSDateFormatter()
//        formatter.dateFormat = "ddMMyyyy-HHmmss"
//        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions: AVAudioSessionCategoryOptions.DefaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
   
    @IBAction func stopRecording(sender: AnyObject) {
        print("Stop recording button pressed")
        recordButton.enabled = true
        stopRecordingButton.enabled = false
        stopRecordingButton.hidden = true
        recordingLabel.text = "Tap to Record"
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Audio finished recording")
        if (flag) {
            //Save the recorded audio
            //recordedAudio = RecordedAudio()
            recordedAudio = recorder.url
            //recordedAudio.title = recorder.url.lastPathComponent
            
            //Move to the next scene aka perform segue
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            print("Recording not successfull")
            recordButton.enabled = true
            stopRecordingButton.hidden = true
        }
        
//        if flag {
//            recordedAudio = RecordedAudio()
//            recordedAudio.filePathUrl = recorder.url
//            recordedAudio.title = recorder.url.lastPathComponent
//            self.performSegueWithIdentifier("stopRecording", sender:recordedAudio)
//            
//        } else {
//            print("Saving or recording failed")
//        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsVC
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL  = recordedAudioURL
        }
//        if segue.identifier == "stopRecording" {
//            let playSoundsVC:PlaySoundsVC = segue.destinationViewController as! PlaySoundsVC
//            let data = sender as! RecordedAudio
//            playSoundsVC.receivedAudio = data
//           // playSoundsViewController.recordedAudio = recordedAudioURL
//        }
    }
    
}

