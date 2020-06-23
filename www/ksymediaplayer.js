"use strict";
function KsyMediaPlayer() {
}



var exec = require('cordova/exec');


KsyMediaPlayer.prototype.play = function (arg0, success, error) {
    exec(success, error, 'ksymediaplayer', 'play', [arg0]);
};


KsyMediaPlayer.prototype.destory = function (arg0, success, error) {
    exec(success, error, 'ksymediaplayer', 'destory', [arg0]);
};





KsyMediaPlayer.install = function () {
    if (!window.plugins) {
        window.plugins = {};
    }
    window.plugins.ksymediaplayer = new KsyMediaPlayer();
    return window.plugins.ksymediaplayer;
};

cordova.addConstructor(KsyMediaPlayer.install);