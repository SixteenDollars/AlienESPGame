//
//  SecondViewController.m
//  AlienESP
//
//  Created by Crack on 3/3/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "SecondViewController.h"
#import "CardManager.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UILabel *guessesLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@end

@implementation SecondViewController

- (IBAction)checkPress:(id)sender {
    NSString* selectedCard = [[CardManager sharedCardManager]getSelectedCard];
    NSString* randomCard = [[CardManager sharedCardManager]getRandomCard];
    int guesses = [[CardManager sharedCardManager]getGuesses];
    self.guessesLabel.text = [NSString stringWithFormat:@"Number of Guesses: %d", guesses];
    if ([selectedCard isEqualToString:randomCard]) {
        [self performSelector:@selector(playWinSound)
                   withObject:nil
                   afterDelay:.5];
    }
    else {
        self.winLabel.text = [NSString stringWithFormat:@"Wrong."];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)playWinSound {
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/04 Walk It Talk It (feat. Drake).m4a",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    player.numberOfLoops = -1; //Infinite
    
    [player play];
    self.winLabel.text = @"WINNER!";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
