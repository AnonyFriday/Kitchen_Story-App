//
//  ViewController_register.h
//  KitchenStory
//
//  Created by Vu Kim Duy on 24/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import <UIKit/UIKit.h>

@import FirebaseDatabase;
@import Firebase;
NS_ASSUME_NONNULL_BEGIN

@interface ViewController_register : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end
NS_ASSUME_NONNULL_END
