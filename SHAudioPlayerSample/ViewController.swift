//
//  ViewController.swift
//  SHAudioPlayerSample
//
//  Created by Shebin Koshy on 23/05/19.
//  Copyright © 2019 Shebin Koshy. All rights reserved.
//

import UIKit
import MediaPlayer
import SHAudioPlayerSDK

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    let player = SHAudioPlayer.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureObservers()
        backgroundActions()
        player.delegate = self
        slider.addTarget(self, action: #selector(ViewController.changeVlaue(_:)), for: .valueChanged)
        resetUI()
    }
    
    @objc func changeVlaue(_ sender: UISlider) {
        player.sliderValueChanged(slider: slider)
    }
    
    public func backgroundActions() {
        UIApplication.shared.beginReceivingRemoteControlEvents()
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget(handler: { (event) in
            self.player.playPauseAction()
            return MPRemoteCommandHandlerStatus.success
        })
        commandCenter.pauseCommand.addTarget(handler: { (event) in
            self.player.pause()
            return MPRemoteCommandHandlerStatus.success
        })
        commandCenter.nextTrackCommand.addTarget(handler: { (event) in
            self.player.next()
            return MPRemoteCommandHandlerStatus.success
        })
        commandCenter.previousTrackCommand.addTarget(handler: { (event) in
            self.player.previous()
            return MPRemoteCommandHandlerStatus.success
        })
    }
    
    func configureObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAudioSessionInterruption), name: AVAudioSession.interruptionNotification, object: AVAudioSession.sharedInstance())
    }
    
    
    @objc func handleAudioSessionInterruption(_ notification : Notification) {
        guard let userInfo = notification.userInfo as? [String: AnyObject] else { return }
        guard let rawInterruptionType = userInfo[AVAudioSessionInterruptionTypeKey] as? NSNumber else { return }
        guard let interruptionType = AVAudioSession.InterruptionType(rawValue: rawInterruptionType.uintValue) else { return }
        
        switch interruptionType {
        case .began:
            player.pause()
        case .ended:
            if let rawInterruptionOption = userInfo[AVAudioSessionInterruptionOptionKey] as? NSNumber {
                let interruptionOption = AVAudioSession.InterruptionOptions(rawValue: rawInterruptionOption.uintValue)
                if interruptionOption == AVAudioSession.InterruptionOptions.shouldResume {
                    if SHAudioPlayer.shared.isPaused() == true {
                        SHAudioPlayer.shared.playPauseAction()
                    }
                }
            }
        @unknown default:
            print("error in interruptionType")
        }
    }
    
    @IBAction func play() {
        let hlsLiveStream = MySongObj()
        hlsLiveStream.songUrl = URL(string: "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://us4.internet-radio.com:8266/listen.pls&t=.m3u")
        hlsLiveStream.albumArtImage = UIImage(named: "MusicImg")
        
        let stream1 = MySongObj()
        stream1.songUrl = URL(string: "http://rom1.be/wp-content/uploads/2013/09/Dimitri-Vegas-Like-Mike-vs.-Sander-Van-Doorn-Project-T-Martin-Garrix-Remix..mp3")
        stream1.albumArtImage = UIImage(named: "MusicImg")
        
        let hlsLiveStream2 = MySongObj()
        hlsLiveStream2.songUrl = URL(string: "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://uk3.internet-radio.com:8405/live.m3u&t=.m3u")
        hlsLiveStream2.albumArtImage = UIImage(named: "MusicImg")
        
        let stream2 = MySongObj()
        stream2.songUrl = URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")
        stream2.albumArtImage = UIImage(named: "MusicImg")
        
        let liveStream1 = MySongObj()
        liveStream1.songUrl = URL(string: "http://strm112.1.fm/acountry_mobile_mp3")
        liveStream1.albumArtImage = UIImage(named: "MusicImg")
        
        let local1 = MySongObj()
        let local1StrUrl = Bundle.main.path(forResource: "system_alerts_melodic_01", ofType: "mp3")
        local1.songUrl = URL(fileURLWithPath: local1StrUrl!)
        local1.albumArtImage = UIImage(named: "MusicImg")
        
        let arSongs = [hlsLiveStream,stream1,hlsLiveStream2,stream2,liveStream1,local1]
        SHAudioPlayer.shared.initialize(songsAr: arSongs)
        
        SHAudioPlayer.shared.play(atIndex: 0)
    }
    
    @IBAction func pause() {
        SHAudioPlayer.shared.pause()
    }
    
    @IBAction func resume() {
        SHAudioPlayer.shared.resume()
    }
    
    @IBAction func prev() {
        SHAudioPlayer.shared.previous()
    }
    
    @IBAction func next() {
        SHAudioPlayer.shared.next()
    }
    
    @IBAction func stop() {
        SHAudioPlayer.shared.stop()
    }
    
    
    func populateLabelWithTime(_ label : UILabel, time: Double) {
        let minutes = Int(time / 60)
        let seconds = Int(time) - minutes * 60
        
        label.text = String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds)
    }
    
    func resetUI() {
        imageV.image = nil
        status.text = ""
        songTitle.text = ""
        currentTime.text = ""
        totalTime.text = ""
        slider.value = 0
    }

}

extension ViewController: SHAudioPlayerDelegate {
    
    
    func shAudioPlayerUpdateInfoCenter(_ shAudioPlayer: SHAudioPlayer) {
        guard let item = SHAudioPlayer.shared.currentPlayerItem() else {
            return;
        }
        
        let title = item.titleToDisplay()
        let currentTime = SHAudioPlayer.shared.progress()
        let duration = SHAudioPlayer.shared.duration()
        let trackNumber = SHPlayList.shared.indexOfSong(song: item)
        let trackCount = SHPlayList.shared.count()
        
        var nowPlayingInfo : [String : AnyObject] = [
            MPMediaItemPropertyPlaybackDuration : duration as AnyObject,
            MPMediaItemPropertyTitle : title as AnyObject,
            MPNowPlayingInfoPropertyElapsedPlaybackTime : currentTime as AnyObject,
            MPNowPlayingInfoPropertyPlaybackQueueCount :trackCount as AnyObject,
            MPNowPlayingInfoPropertyPlaybackQueueIndex : trackNumber as AnyObject,
            MPMediaItemPropertyMediaType : MPMediaType.anyAudio.rawValue as AnyObject
        ]
        
        if let img = item.albumArtImage {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(image: img)
        }
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    
    func shAudioPlayerItemDidChanged(_ shAudioPlayer: SHAudioPlayer)//When next or previous need to refresh UI (reload tableview's current playing song selection)
    {
        print("shAudioPlayerItemDidChanged")
    }
    
    func shAudioPlayer(_ shAudioPlayer: SHAudioPlayer, updateCurrentItemTitle:String?) {
        print("updateCurrentItemTitle")
        self.songTitle.text = updateCurrentItemTitle
    }
    
    func shAudioPlayer(_ shAudioPlayer: SHAudioPlayer!, updateSliderValue value: CGFloat, currentTime: Double, duration: Double) {
        slider.value = Float(value)
        populateLabelWithTime(self.currentTime, time: currentTime)
        populateLabelWithTime(self.totalTime, time: duration)
    }
    
    func shAudioPlayerStatusDidChanged(_ shAudioPlayer: SHAudioPlayer) {
        print("shAudioPlayerStatusDidChanged")
        if shAudioPlayer.isLoading() == true {
            status.text = "loading"
        } else if shAudioPlayer.isReady() == true {
            resetUI()
            status.text = "stopped"
        } else if shAudioPlayer.isPlaying() == true {
            status.text = "playing"
            imageV.image = shAudioPlayer.currentPlayerItem()?.albumArtImage
        } else if shAudioPlayer.isPaused() == true {
            status.text = "paused"
        }
    }
    
    func shAudioPlayerResetDurationUI(_ shAudioPlayer: SHAudioPlayer)//Live url case need to reset duration
    {
        slider.value = 0
        populateLabelWithTime(self.currentTime, time: 0)
        populateLabelWithTime(self.totalTime, time: 0)
    }
    
    public func shAudioPlayer(_ shAudioPlayer: SHAudioPlayer, didEndCurrentItem:SHAudioPlayerItemProtocol) {
        print("didEndCurrentItem")
    }
    
}

