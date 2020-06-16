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
    //[_textField_password setSecureTextEntry:YES];
    
    /********************************Testing Realtime Database************************/
    self.ref = [[FIRDatabase database] reference];

}



// transition to the home_viewControllers
- (IBAction)button_login:(id)sender {
    NSLog(@"%@ password", _textField_password.text);
    /********************************Testing Realtime Database************************/
    @try {
        [[[_ref child:@"account"] child:[self->_textField_email text]] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot){
          
            if( [snapshot exists])
            {
                NSString *username = snapshot.value[@"name"];
                NSString *password = snapshot.value[@"password"];
                
                if ( self->_textField_email.text == username
                && self->_textField_password.text == password ){
                
                UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                UITabBarController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"TabBarController_1"];
                
                [vc setModalPresentationStyle:UIModalPresentationFullScreen];
                [self presentViewController:vc animated:YES completion:nil];
                    
                } else {
                    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Your Username Or Password Is Invalid"
                                                                                   message:@"Try to login again"
                                                                            preferredStyle:UIAlertControllerStyleAlert];
                         
                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                                            style:UIAlertActionStyleDefault
                                                                          handler:^(UIAlertAction * action) {}];
                    [alert addAction:defaultAction];
                    [self presentViewController:alert animated:YES completion:nil];
                }
            } else {
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Your Username Or Password Is Invalid"
                                                                               message:@"Try to login again"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                     
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                                        style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
            
            } withCancelBlock:^(NSError * _Nonnull error) {
                             NSLog(@"%@", error.localizedDescription);
                           }];
            
            
            
    } @catch (NSException *exception) {
        NSLog(@"Problem in Logging");
    } @finally {
        NSLog(@"The end of Loggin function");
    }
    
    
    
//    inforDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"1234",@"1234",@"0000",@"0000",nil];
//
    
//
//    if([_textField_email.text isEqualToString:[inforDictionary objectForKey:_textField_password.text]]){
//
//
//
//        UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UITabBarController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"TabBarController"];
//
//        [vc setModalPresentationStyle:UIModalPresentationFullScreen];
//        [self presentViewController:vc animated:YES completion:nil];
//
//    } else {
//        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Your Username Or Password Is Invalid"
//                                       message:@"Try to login again"
//                                       preferredStyle:UIAlertControllerStyleAlert];
//
//        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//           handler:^(UIAlertAction * action) {}];
//
//        [alert addAction:defaultAction];
//        [self presentViewController:alert animated:YES completion:nil];
//    }
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
