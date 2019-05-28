# SHAudioPlayer
[#audioplayer](https://github.com/topics/audioplayer)
[#mp3player](https://github.com/topics/mp3player)
[#HLS](https://github.com/topics/hls)
[#livestream](https://github.com/topics/livestream)
[#audiostream](https://github.com/topics/audiostream)
[#radio](https://github.com/topics/radio)
[#radioplayer](https://github.com/topics/radioplayer)
[#musicplayer](https://github.com/topics/musicplayer)
[#musicstream](https://github.com/topics/musicstream)
[#objective-c](https://github.com/topics/objective-c)
[#swift](https://github.com/topics/swift)
[#swift5](https://github.com/topics/swift5)
[#iOS](https://github.com/topics/ios)

### AudioPlayer supports
* Live audio streaming
* HLS/m3u8/m3u audio streaming
* Play from local audio file
* Supports many audio codecs incluing mp3
* Swift 5
* Objective-C
* iOS 9 and above


### Provided code for
* Audio interruptions handling
* Background play
* Actions from Control Center/EarPods
* Update UI in Control Center


### How to use?
Drag and drop SDK in your project.

To play use below code
```
let song = MySongObj()
song.songUrl = your song URL
hlsLiveStream.albumArtImage = UIImage(named: "MusicImg")
let arSongs = [song]
SHAudioPlayer.shared.initialize(songsAr: arSongs)
SHAudioPlayer.shared.play(atIndex: 0)
```

For more details, please look `ViewController.swift` in sample project.

#### On request features will be added.
