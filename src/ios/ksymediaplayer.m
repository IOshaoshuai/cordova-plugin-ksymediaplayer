#import <Cordova/CDV.h>
#import <KSYMediaPlayer/KSYMoviePlayerController.h>


@interface ksymediaplayer : CDVPlugin {
    UIView *_videoView;
    KSYMoviePlayerController *_player;



}

- (void)play:(CDVInvokedUrlCommand*)command;
- (void)destory:(CDVInvokedUrlCommand*)command;

@end

@implementation ksymediaplayer


- (void)play:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* url = [command.arguments objectAtIndex:0];

    if (url != nil && [url length] > 0) {

        [self playWithUrl:url];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:url];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


-(void)closeBtnClick:(id)sender
{
    [self closePlayer];
}


- (void)initPlayerWithURL:(NSURL *)aURL {



    //init video view
    _videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.viewController.view.bounds.size.width, self.viewController.view.bounds.size.height)];
    _videoView.backgroundColor = [UIColor lightGrayColor];

    //init close btn
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 75)];

    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];




    //init player
    _player = [[KSYMoviePlayerController alloc] initWithContentURL: aURL  ];

       _player.logBlock = ^(NSString *logJson){
           NSLog(@"logJson is %@",logJson);
       };
     _player.controlStyle = MPMovieControlStyleNone;
    [_player.view setFrame: _videoView.bounds];  // player's frame must match parent's
    _videoView.autoresizesSubviews = TRUE;
    _player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;

    _player.shouldAutoplay = TRUE;
         _player.bufferTimeMax = 2;
        _player.bufferSizeMax = 15;
    _player.scalingMode = MPMovieScalingModeAspectFit;
        [_player setTimeout:10 readTimeout:20];

    [self.viewController.view addSubview: _videoView];
    [_videoView addSubview: _player.view];
    [_player.view addSubview:closeBtn];

    [_player prepareToPlay];
}


- (void)playWithUrl:(NSString *)url{


    if(nil == _player)
        [self initPlayerWithURL:[NSURL URLWithString:url]];


    if(_player)
       {
           NSLog(@"sdk version:%@", [_player getVersion]);
           //如果再次播放的话，设置下次播放的地址
            [_player setUrl:[NSURL URLWithString:url]];
            [_player prepareToPlay];
        }

    [_videoView setHidden:false];



}



- (void)closePlayer{
    [_player reset:NO];

    [_videoView setHidden:true];
}




- (void)destory:(CDVInvokedUrlCommand*)command {

 }



@end
