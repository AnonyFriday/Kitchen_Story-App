//
//  ViewController.h
//  KitchenStory
//
//  Created by USER1 on 5/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FirebaseDatabase;
@import Firebase;

@interface ViewController_login : UIViewController<UITextFieldDelegate>
//    NSMutableDictionary *inforDictionary;
@property(nonatomic, strong)NSMutableDictionary* inforDictionary;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

