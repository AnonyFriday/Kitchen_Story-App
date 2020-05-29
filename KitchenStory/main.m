//
//  main.m
//  KitchenStory
//
//  Created by USER1 on 5/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
