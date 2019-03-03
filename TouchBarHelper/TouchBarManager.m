//
//  TouchBarManager.m
//  TouchBarHelper
//
//  Created by Pauli Jokela on 03/03/2019.
//  Copyright © 2019 Didstopia. All rights reserved.
//

#import "TouchBarManager.h"

#import "TouchBarPrivateApi.h"

@interface TouchBarManager () <NSTouchBarDelegate>
@end

const static NSString *TextLabelItemIdentifier = @"com.didstopia.identifer.text";

@implementation TouchBarManager

#pragma mark - Shared Instance
+ (id)shared {
    static TouchBarManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - Initialization
- (id)init {
    if (self = [super init]) {
        _touchBarContents = @"";
        _touchBar = [self makeTouchBar];
    }
    return self;
}

#pragma mark - NSTouchBar
- (NSTouchBar *)makeTouchBar {
    NSTouchBar *touchBar = [[NSTouchBar alloc] init];
    [touchBar setDelegate:self];
    
    touchBar.customizationIdentifier = [TextLabelItemIdentifier copy];
    
    // Set the default ordering of items
    touchBar.defaultItemIdentifiers = @[TextLabelItemIdentifier];
    touchBar.customizationAllowedItemIdentifiers = @[TextLabelItemIdentifier];
    
    return touchBar;
}

#pragma mark - NSTouchBarDelegate
- (nullable NSTouchBarItem *)touchBar:(NSTouchBar *)touchBar makeItemForIdentifier:(NSTouchBarItemIdentifier)identifier {
    
    if (_touchBarItem == nil) {
        _touchBarItem = [[NSCustomTouchBarItem alloc] initWithIdentifier:identifier];
    }
    
    if ([identifier isEqualToString:[TextLabelItemIdentifier copy]]) {
        NSTextField *textField = [[NSTextField alloc] init];
        [textField setTextColor:[NSColor whiteColor]];
        [textField setAlignment:NSTextAlignmentCenter];
        [textField setStringValue:_touchBarContents];
        [_touchBarItem setView:textField];
    }
    
    return _touchBarItem;
}

#pragma mark - Touch bar helpers
- (void)setTouchBarContents:(NSString*)contents {
    _touchBarContents = contents;
    [(NSTextField*)_touchBarItem.view setStringValue:_touchBarContents];
}
- (void)setTouchBarContentsAlignment:(NSTextAlignment)alignment {
    [(NSTextField*)_touchBarItem.view setAlignment:alignment];
}

- (void)showTouchBar {
    [NSTouchBar presentSystemModalTouchBar:_touchBar systemTrayItemIdentifier:[TextLabelItemIdentifier copy]];
}
- (void)hideTouchBar {
    [NSTouchBar dismissSystemModalTouchBar:_touchBar];
}

@end
