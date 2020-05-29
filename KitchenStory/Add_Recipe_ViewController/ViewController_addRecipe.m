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


}

- (IBAction)addItemToTableView:(id)sender {
}




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
