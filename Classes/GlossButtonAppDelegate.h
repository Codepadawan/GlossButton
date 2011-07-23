//
//  GlossButtonAppDelegate.h
//  GlossButton
//
//  Created by Chris Jones on 10/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GlossButtonViewController;

@interface GlossButtonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GlossButtonViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GlossButtonViewController *viewController;

@end

