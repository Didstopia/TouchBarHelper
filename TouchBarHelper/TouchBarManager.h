//
//  TouchBarManager.h
//  TouchBarHelper
//
//  Created by Pauli Jokela on 03/03/2019.
//  Copyright © 2019 Didstopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TouchBarManager : NSObject {
    NSTouchBar *_touchBar;
    NSString *_touchBarContents;
    NSCustomTouchBarItem *_touchBarItem;
}

+ (id)shared;

- (void)setTouchBarContents:(NSString*)contents;
- (void)setTouchBarContentsAlignment:(NSTextAlignment)alignment;

- (void)showTouchBar;
- (void)hideTouchBar;

@end

NS_ASSUME_NONNULL_END
