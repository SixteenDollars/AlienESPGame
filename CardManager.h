//
//  CardManager.h
//  AlienESP
//
//  Created by Crack on 3/15/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardManager : NSObject

#pragma mark - Main methods
+ (CardManager *) sharedCardManager;

- (void) setSelectedCard: (NSString *) newCard;
- (NSString *) getSelectedCard;
- (void) updateGuesses;
- (int) getGuesses;
- (void) setRandomCard: (NSString *) newRandomCard;
- (NSString *) getRandomCard;


@end
