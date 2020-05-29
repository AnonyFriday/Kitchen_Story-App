//
//  ViewController.m
//  KitchenStory
//
//  Created by USER1 on 5/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import "ViewController_login.h"
#import "ViewController_register.h"
#import "ViewController_home.h"

@interface ViewController_login ()

@property (strong, nonatomic) IBOutlet UITextField *textField_email;
@property (strong, nonatomic) IBOutlet UITextField *textField_password;


@end

@implementation ViewController_login

@synthesize inforDictionary;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [_textField_email setDelegate:self];
    [_textField_password setDelegate:self];
    
    //store user's information
    
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view endEditing:YES];
//}

// transition to the home_viewControllers
- (IBAction)button_login:(id)sender {
    inforDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"1234",@"1234",@"0000",@"0000",nil];
    //[inforDictionary setObject:connector_register.userName_beingPass forKey:connector_register.password_beingPass];
    if([_textField_email.text isEqualToString:[inforDictionary objectForKey:_textField_password.text]]){
        
        UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController_home *vc_home = [storyBoard instantiateViewControllerWithIdentifier:@"TabBarController"];
        
        [vc_home setModalPresentationStyle:UIModalPresentationFullScreen];
        [self presentViewController:vc_home animated:YES completion:nil];
        
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Your Username Or Password Is Invalid"
                                       message:@"Try to login again"
                                       preferredStyle:UIAlertControllerStyleAlert];
         
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {}];
         
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}




// dismiss the keyboard when touching outside the keyboard and when touching the return
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textField_email resignFirstResponder];
    [_textField_password resignFirstResponder];
    return YES;
}

//transition to anotehr scene

@end
