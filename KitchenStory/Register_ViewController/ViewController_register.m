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
    
    // Do any additional setup after loading the view.
    [_textfield_email setDelegate:self];
    [_textfield_password setDelegate:self];
    [_textfield_retype_password setDelegate:self];
    //dismiss the keyboard on SCROLLVIEW
    [_scrollView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    
}


- (IBAction)comebackToLogin:(id)sender {
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController_login *vc_login = [storyBoard instantiateViewControllerWithIdentifier:@"ViewController_login"];
    
    //solutions for register the account
    vc_login.inforDictionary = @{
        _textfield_email.text:_textfield_password.text
    };
    //Testing
    [vc_login setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc_login animated:YES completion:nil];
    
}






- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textfield_email resignFirstResponder];
    [_textfield_retype_password resignFirstResponder];
    [_textfield_password resignFirstResponder];
    return YES;
}


@end
