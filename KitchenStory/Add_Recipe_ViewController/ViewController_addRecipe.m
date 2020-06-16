//
//  ViewController_addRecipe.m
//  KitchenStory
//
//  Created by Vu Kim Duy on 18/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import "ViewController_addRecipe.h"

#import <QuartzCore/QuartzCore.h>


@interface ViewController_addRecipe ()
@property (strong, nonatomic) IBOutlet UITextField *textField_recipeName;
@property (strong, nonatomic) IBOutlet UITextView *textView_ingredient;
@property (strong, nonatomic) IBOutlet UITextView *textView_howToCook;


@end

@implementation ViewController_addRecipe
@synthesize textField_recipeName;
@synthesize textView_ingredient;
@synthesize textView_howToCook;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.ref = [[FIRDatabase database] reference];

}

//add data to the realtime firebase
- (IBAction)addItemToTableView:(id)sender {
    @try {
        NSString *foodName = [textField_recipeName text];
        NSString *howToCook = [[textView_howToCook text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString *ingredients = [[textView_ingredient text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if([howToCook length] == 0 || [ingredients length] == 0)
        {
            
            
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Unable to add"
                                                  message:@"Please add something for your wonderful recipe"
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaulAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
            [alert addAction:defaulAction];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            
            [[[self.ref child:@"foods"] child:foodName] setValue:@{
                @"name": foodName,
                @"howToCook": howToCook,
                @"ingredients": ingredients
            }];
            
/**Can also use the updateChildValue to update the child */
//            [[[self.ref child:@"foods"] child:foodName] updateChildValues:@{
//                @"name": foodName,
//                @"howToCook": howToCook,
//                @"ingredients": ingredients
//            }];
            
            NSLog(@"Successfully Add Data");
            
            //Configuring and presenting an alert
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add Recipe"
                                           message:@"Add Successfully"
                                           preferredStyle:UIAlertControllerStyleAlert];
             
            //Move to the Home scene after pressing the OK button
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                UITabBarController *myVC = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"TabBarController_1"];
                
                // set the style of transition is modally and fullscreen
                [myVC setModalPresentationStyle:UIModalPresentationFullScreen];
                [self presentViewController:myVC animated:YES completion:nil];
            }]];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    } @catch (NSException *exception) {
        NSLog(@"Something wrong, try again");
    } @finally {
        NSLog(@"End of saving method");
    }
    
    
    
}

/**************************************Testing Delete Function/
//-(void)deleteItem:(id)sender{
//    NSString *foodName = [textField_recipeName text];
//    [[[self.ref child:@"foods"] child:foodName] removeValue];
//} */


/**************************************Testing Search Function*/
-(IBAction)searchClicked:(id)sender{
    
    @try {
        NSString *foodID = [textField_recipeName text];
        [[[_ref child:@"foods"] child:foodID] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
            
            //if I have a searching function, it will return the value from the firebase whenever i search the food's name
            //if data is existed
            if ( [snapshot exists])
            {
                self->textView_howToCook.text = snapshot.value[@"howToCook"];
                self->textView_ingredient.text = snapshot.value[@"ingredients"];
            } else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No data found" message:@"I'm testing the search function"  preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaulAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                
                [alert addAction:defaulAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
            
            
        } withCancelBlock:^(NSError * _Nonnull error) {
            NSLog(@"%@", error.localizedDescription);
        }];
        
        
    } @catch (NSException *exception) {
        NSLog(@"Problem in search");
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Testing Searching function" message:@"I'm testing the search function"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaulAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:defaulAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    } @finally {
        NSLog(@"The end of Searching function");
    }

    
}
//dismiss the keyboard
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
