//
//  ViewController.swift
//  SoundPad
//
//  Created by Jens Barth on 17.09.19.
//  Copyright © 2019 STABILO International GmbH. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundEffect: AVAudioPlayer?

    @IBOutlet weak var TheaterButton: UIButton!
    @IBOutlet weak var ToiletteButton: UIButton!
    @IBOutlet weak var TatortButton: UIButton!
    @IBOutlet weak var FurzButton: UIButton!
    @IBOutlet weak var AstButton: UIButton!
    @IBOutlet weak var TelefonButton: UIButton!
    @IBOutlet weak var STOPButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else { return }
        print(touch.force)
        
                if view.traitCollection.forceTouchCapability == .available {
                    print(touch.force)
                    if touch.force == touch.maximumPossibleForce {

                    }
                
            
        }
    }
    
    @IBAction func TheaterButtonClicked(_ sender: Any) {
        playSound(filename: "KatjaEpsteinTheater (online-audio-converter.com).mp3")
    }
    
    @IBAction func TürklingelButtonClicked(_ sender: Any) {
        playSound(filename: "doorbell2-6450.mp3")
    }
    
    @IBAction func TatortButtonClicked(_ sender: Any) {
        playSound(filename: "tatort-klingelton-mp3-100_laenger.mp3")
    }
    
    @IBAction func JamesBondButtonClicked(_ sender: Any) {
        playSound(filename: "Bond.wav")
    }
    
    @IBAction func MissionImpossibleButtonClicked(_ sender: Any) {
        playSound(filename: "MissionImpossible.wav")
    }
    
    @IBAction func TelefonButtonClicked(_ sender: Any) {
        playSound(filename: "Altes Telefon Klingelton (Ring Ring klassisch) als MP3-Datei.mp3")
    }
    
    @IBAction func STOPButtonClicked(_ sender: Any) {
        if soundEffect!.isPlaying
        {
            soundEffect?.stop()
        }
    }
    
    func playSound(filename: String) {
        
        let path = Bundle.main.path(forResource: filename, ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
}

