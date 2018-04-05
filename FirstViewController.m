//
//  FirstViewController.m
//  AlienESP
//
//  Created by Crack on 3/3/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "FirstViewController.h"
#import "CardManager.h"
#include <time.h>
#include <stdlib.h>
#import <UIKit/UIKit.h>
#define FaceComponent 0
#define SuitComponent   1

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *cardPicker;
@property NSArray *faceValue;
@property NSArray *suitValue;
- (IBAction)selectedCard:(id)sender;

@end

@implementation FirstViewController

NSString * selectedFaceValue;
NSString * selectedSuitValue;
int randomNum;
int face;
int suit;

- (IBAction)selectedCard:(id)sender {
    [self selectCurrentCard];
}

- (void) selectCurrentCard {
    NSString * selectedCard = [NSString stringWithFormat:@"%@ %@", selectedFaceValue, selectedSuitValue];
    [[CardManager sharedCardManager]setSelectedCard: selectedCard];
    [[CardManager sharedCardManager]updateGuesses];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    randomNum = arc4random() % 52;
    face = randomNum % 13;
    if (face == 0)
        face = 13;
    suit = randomNum - face;
    if (suit == 0)
        [[CardManager sharedCardManager]setRandomCard:[NSString stringWithFormat:@"The %d of ♥️", face]];
    if (suit == 13)
        [[CardManager sharedCardManager]setRandomCard:[NSString stringWithFormat:@"The %d of ♣️", face]];
    if (suit == 26)
        [[CardManager sharedCardManager]setRandomCard:[NSString stringWithFormat:@"The %d of ♦️", face]];
    if (suit == 39)
        [[CardManager sharedCardManager]setRandomCard:[NSString stringWithFormat:@"The %d of ♠️", face]];
    
    self.faceValue = @[@"The 1 of", @"The 2 of", @"The 3 of",
                  @"The 4 of", @"The 5 of",
                  @"The 6 of", @"The 7 of", @"The 8 of", @"The 9 of", @"The 10 of",
                  @"The 11 of", @"The 12 of",
                  @"The 13 of"];
    
    self.suitValue = @[@"♥️", @"♣️", @"♦️", @"♠️"];
    
    selectedFaceValue = self.faceValue[0];
    selectedSuitValue = self.suitValue[0];
    
    [self.cardPicker selectRow:0 inComponent:0 animated:NO];
    [self.cardPicker selectRow:0 inComponent:1 animated:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    if (component == 0)
        return [self.faceValue count];
    else
        return [self.suitValue count];
}

#pragma mark Picker Delegate Methods
- (NSString*)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
      forComponent:(NSInteger)component {
    if (component == 0)
        return self.faceValue[row];
    else
        return self.suitValue[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0)
        selectedFaceValue = self.faceValue[row];
    else
        selectedSuitValue = self.suitValue[row];
}

@end


