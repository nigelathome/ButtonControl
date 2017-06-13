//
//  PlayerController.swift
//  Control Fun
//
//  Created by Nigel Lee on 13/06/2017.
//  Copyright © 2017 Apress. All rights reserved.
//

import Foundation
import AVFoundation

protocol PlayerControllerDelegate: class {
    func playbackStopped()
    func playbackBegan()
}

class PlayerController: NSObject, AVAudioPlayerDelegate {
    var playing = false
    weak var delegate: PlayerControllerDelegate?
    var players: [AVAudioPlayer]!
    
    override init() {
        super.init()
        let guitarPlayer = playerForFile("guitar")
        let bassPlayer = playerForFile("bass")
        let drumsPlayer = playerForFile("drums")
        
        guitarPlayer.delegate = self
        let nc = NotificationCenter.default
        
        nc.addObserver(self, selector: #selector(handleInterruption), name: NSNotification.Name.AVAudioSessionInterruption, object: AVAudioSession.sharedInstance())
        nc.addObserver(self, selector: #selector(handleRouteChange), name: NSNotification.Name.AVAudioSessionRouteChange, object: AVAudioSession.sharedInstance())
        
        players = [guitarPlayer, bassPlayer, drumsPlayer]
    }
    
    // read the cat file from resource directory
    func playerForFile(_ name: String) -> AVAudioPlayer {
        let fileURL = Bundle.main.url(forResource: name, withExtension: "caf")!
        do {
            let player = try AVAudioPlayer(contentsOf: fileURL)
            player.numberOfLoops = -1 //Any negative number will loop indefinitely until stopped.
            player.enableRate = true
            player.prepareToPlay()
            return player
        } catch let error as NSError {
            print("Error creating player: \(error.localizedDescription)")
            fatalError()
        }
    }
    
    func play() {
        if !playing {
            let delayTime = players.first!.deviceCurrentTime + 0.01
            for player in players {
                player.play(atTime: delayTime)
            }
            playing = true
        }
    }
    
    func stop() {
        if playing {
            for player in players {
                player.stop()
                player.currentTime = 0.0
            }
            playing = false
        }
    }
    
    func isValidIndex(_ index: Int) -> Bool {
        return index >= 0 && index < players.count
    }
    
    func adjustPan(_ pan: Double, forPlayerAtIndex idx: Int) {
        if isValidIndex(idx) {
            players[idx].pan = Float(pan)
        }
    }
    
    func adjustVolume(_ volume: Double, forPlayerAtIndex idx: Int) {
        if isValidIndex(idx) {
            players[idx].volume = Float(volume)
        }
    }
    
    func handleInterruption(_ notification: Notification) {
        if let info = (notification as NSNotification).userInfo {
            let type = info[AVAudioSessionInterruptionTypeKey] as! AVAudioSessionInterruptionType
            if type == .began {
                stop()
                delegate?.playbackStopped()
            } else {
                let options = info[AVAudioSessionInterruptionOptionKey] as! AVAudioSessionInterruptionOptions
                if options == .shouldResume {
                    play()
                    delegate?.playbackBegan()
                }
            }
        }
    }
    
    func handleRouteChange(_ notification: Notification) {
        if let info = (notification as NSNotification).userInfo {
            
            let reason = info[AVAudioSessionRouteChangeReasonKey] as! AVAudioSessionRouteChangeReason
            if reason == .oldDeviceUnavailable {
                let previousRoute = info[AVAudioSessionRouteChangePreviousRouteKey] as! AVAudioSessionRouteDescription
                let previousOutput = previousRoute.outputs.first!
                if previousOutput.portType == AVAudioSessionPortHeadphones {
                    stop()
                    delegate?.playbackStopped()
                }
            }
        }
    }


    
    

    
}

