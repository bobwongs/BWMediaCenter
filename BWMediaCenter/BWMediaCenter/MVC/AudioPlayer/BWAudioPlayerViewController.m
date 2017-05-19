//
//  BWAudioPlayerViewController.m
//  BWMediaCenter
//
//  Created by BobWong on 2017/5/19.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWAudioPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

NSString *const BWKeyPathAudioPlayerDuration = @"duration";

@interface BWAudioPlayerViewController ()

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation BWAudioPlayerViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"music_baishi_kle_Days_on_my_past" ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [self addObserver:self forKeyPath:BWKeyPathAudioPlayerDuration options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:BWKeyPathAudioPlayerDuration context:nil];
}

#pragma mark - Public Method

#pragma mark - Action

- (IBAction)playAction:(id)sender {
    if (_audioPlayer.isPlaying) {
        [_audioPlayer stop];
    } else {
        [_audioPlayer play];
    }
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    id newValue = change[NSKeyValueChangeNewKey];
    
    if ([keyPath isEqualToString:BWKeyPathAudioPlayerDuration]) {
        NSTimeInterval interval = [newValue doubleValue];
        NSLog(@"new duration value is %f", interval);
    }
}

#pragma mark - Network

#pragma mark - Custom Delegate

#pragma mark - System Delegate

#pragma mark - Private Method

#pragma mark - Getter and Setter

@end
