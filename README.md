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

Contact the development team:  [![Join the chat at https://gitter.im/iOS-objectiveC-swift/iOSsupport](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/iOS-objectiveC-swift/iOSsupport?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

### AudioPlayer supports
* Live audio streaming
* HLS/m3u8/m3u audio streaming
* Play from local audio file
* Supports many audio codecs incluing mp3 & m4a
* Swift 5
* ~~Objective-C~~
* iOS 9 and above
* Manages playlist


### Provided code for
* Audio interruptions handling
* Background play
* Actions from Control Center/EarPods
* Update UI in Control Center


### How to use?
Drag and drop SDK in your project.

Create song object
```
let song = MySongObj()//MySongObj is your class which implements SHAudioPlayerItemProtocol
song.songUrl = your song URL
song.albumArtImage = UIImage(named: "MusicImg")//Optional album art image. Also support url, provided code in MySongObj class.
```
Setup playlist
```
let arSongs = [song]//Playlist
SHAudioPlayer.shared.initialize(songsAr: arSongs)
```
Play
```
SHAudioPlayer.shared.play(atIndex: 0)
```

For more details, please look `ViewController.swift` in sample project.

#### On request features will be added.
