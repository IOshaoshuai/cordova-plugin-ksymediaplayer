感谢[Jetbrain](https://www.jetbrains.com/?from=goutils) 为开源事业提供的支持。  
感谢金山云对行业做出的贡献。

# Summary
金山云播放器进行封装，方便cordova 应用开发。  
金山云ios项目:   https://github.com/ksvc/KSYMediaPlayer_iOS


# Install 
cordova plugin add https //github.com/luaxlou/cordova-plugin-ksymediaplayer.git

# Usage
```
if(typeof window.plugins.ksymediaplayer =='undefined') {
  alert('Please make sure has installed ksymediaplayer plugin ')
}


window.plugins.ksymediaplayer.play(url, (res) => {
  console.log(res)
}, (err) => {
  console.log(err)
})
```

# TODO
android 封装 : ksymediaplay_android 并不支持rtsp，因此暂时不做封装

