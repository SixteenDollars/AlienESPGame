//
//  RootViewController.m
//  AlienESP
//
//  Created by Crack on 3/5/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

}

- (void) viewDidAppear {
    NSString * selectedCard = [[CardManager sharedCardManager] getSelectedCard];
    NSLog(@"%@", selectedCard);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
