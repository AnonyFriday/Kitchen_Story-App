//
//  ViewController_register.m
//  KitchenStory
//
//  Created by Vu Kim Duy on 24/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import "ViewController_register.h"
#import "ViewController_login.h"

@interface ViewController_register ()
@property (strong, nonatomic) IBOutlet UITextField *textfield_email;
@property (strong, nonatomic) IBOutlet UITextField *textfield_password;
@property (strong, nonatomic) IBOutlet UITextField *textfield_retype_password;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController_register


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /********************************Testing Realtime Database************************/
    self.ref = [[FIRDatabase database] reference];
    
    // Do any additional setup after loading the view.
    [_textfield_email setDelegate:self];
    [_textfield_password setDelegate:self];
    [_textfield_retype_password setDelegate:self];
    
    //set secure text for password and retype password
    
 /************************************************************************updated: For somereason, i cannot get the text value from the textfield when setting the secure mode******************************/
    
//    [_textfield_password setSecureTextEntry:TRUE];
//    [_textfield_retype_password setSecureTextEntry:TRUE];
    //dismiss the keyboard on SCROLLVIEW
    
    [_scrollView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    
}


- (IBAction)comebackToLogin:(id)sender {
    
    /********************************Testing Realtime Database************************/
    if([self->_textfield_retype_password text]
       == [self->_textfield_password text] ) {
        
        [[[self.ref child:@"account"] child:[self->_textfield_email text]]
         setValue:@{@"name":[self->_textfield_email text],
                    @"password":[self->_textfield_password text]
         }];
        
        UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController_login *vc_login = [storyBoard instantiateViewControllerWithIdentifier:@"ViewController_login"];
        [vc_login setModalPresentationStyle:UIModalPresentationFullScreen];
        [self presentViewController:vc_login animated:YES completion:nil];
        
    } else {
        
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle:@"Password does not match"
                                    message:@"Please confirm your password"
                                    preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction:defaultAction];
        
        [self presentViewController:alert animated:YES
                         completion:nil];
    }
    
    
    
    
    
    
    
    //solutions for register the account
//    vc_login.inforDictionary = @{
//        _textfield_email.text:_textfield_password.text
//    };
    //Testing
    
    
}






- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textfield_email resignFirstResponder];
    [_textfield_retype_password resignFirstResponder];
    [_textfield_password resignFirstResponder];
    return YES;
}


@end
