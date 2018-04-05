//
//  CardManager.m
//  AlienESP
//
//  Created by Crack on 3/15/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "CardManager.h"

@implementation CardManager : NSObject

static CardManager *sharedCardManager = nil;
static NSString * selectedCard = @"";
static int guesses = 0;
static NSString * randomCard = @"";

+ (CardManager *) sharedCardManager {
    if (sharedCardManager == nil) {
        sharedCardManager = [[super allocWithZone:NULL] init];
    }
    return sharedCardManager;
}

- (void) setSelectedCard: (NSString *) newCard {
    selectedCard = newCard;
}

- (NSString *) getSelectedCard {
    return selectedCard;
}

- (void) updateGuesses {
    guesses++;
}

- (int) getGuesses {
    return guesses;
}

- (void) setRandomCard: (NSString *) newRandomCard {
    randomCard = newRandomCard;
}

- (NSString *) getRandomCard {
    return randomCard;
}

@end
