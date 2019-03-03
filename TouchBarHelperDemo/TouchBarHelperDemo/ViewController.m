//
//  ViewController.m
//  TouchBarHelperDemo
//
//  Created by Pauli Jokela on 03/03/2019.
//  Copyright © 2019 Didstopia. All rights reserved.
//

#import "ViewController.h"

@import TouchBarHelper;

@implementation ViewController

- (IBAction)buttonPressed:(id)sender {
    _counter++;
    
    [[TouchBarManager shared] setTouchBarContents:[NSString stringWithFormat:@"Button pressed %i times!", _counter]];
}

- (IBAction)showPressed:(id)sender {
    [[TouchBarManager shared] showTouchBar];
}

- (IBAction)hidePressed:(id)sender {
    [[TouchBarManager shared] hideTouchBar];
}

- (IBAction)alignLeftPressed:(id)sender {
    [[TouchBarManager shared] setTouchBarContentsAlignment:NSTextAlignmentLeft];
}
- (IBAction)alignCenterPressed:(id)sender {
    [[TouchBarManager shared] setTouchBarContentsAlignment:NSTextAlignmentCenter];
}
- (IBAction)alignRightPressed:(id)sender {
    [[TouchBarManager shared] setTouchBarContentsAlignment:NSTextAlignmentRight];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[TouchBarManager shared] showTouchBar];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
