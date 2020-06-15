//
//  ViewController_showItem.m
//  KitchenStory
//
//  Created by Vu Kim Duy on 23/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import "ViewController_showItem.h"

@interface ViewController_showItem ()

@property (strong, nonatomic) IBOutlet UILabel *foodName_Label;
@property (strong, nonatomic) IBOutlet UIImageView *foodImage_ImageView;
@property (strong, nonatomic) IBOutlet UITextView *ingre_howToCook_TextView;

@end

@implementation ViewController_showItem
@synthesize foodName;
@synthesize foodImage;


- (void)viewDidLoad {
    [super viewDidLoad];
    // food Dictionary
    foodImage_Dictionary = @{
        @"Ann": @"image_1",
        @"Ashley":@"image_2",
        @"Bill":@"image_3",
        @"Billy":@"image_4",
        @"Bob":@"image_5",
        @"Charlie":@"image_6",
        @"Chimney":@"image_7",
        @"Chick":@"image_8"
    };
    
    food_IngredientDetails_HowToCook_Dictionary = @{
        @"Ann": @[
                @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam efficitur condimentum nisl non varius. Sed consequat, erat non hendrerit facilisis, mauris lacus pharetra nulla",
                @"Pellentesque semper sapien orci, non blandit elit tristique in. Maecenas sit amet vehicula tortor. Etiam auctor maximus ex, ac ultricies risus dignissim non. "],

        @"Ashley":@[
                @"Vivamus cursus libero a sem venenatis luctus. Nam eu turpis nulla. Maecenas sagittis quam ac porttitor varius. Vestibulum semper fringilla augue, nulla",
                @"Maecenas ullamcorper sit amet arcu ut semper. Donec vel turpis sed tellus egestas condimentum"],
        @"Bill":@[
                @"Vivamus cursus libero a sem venenatis luctus. Nam eu turpis nulla. Maecenas sagittis quam ac porttitor varius. Vestibulum semper fringilla augue, nulla",
                @"Maecenas ullamcorper sit amet arcu ut semper. Donec vel turpis sed tellus egestas condimentum"],
        @"Billy":@[
                @"Vivamus cursus libero a sem venenatis luctus. Nam eu turpis nulla. Maecenas sagittis quam ac porttitor varius. Vestibulum semper fringilla augue, nulla",
                @"Maecenas ullamcorper sit amet arcu ut semper. Donec vel turpis sed tellus egestas condimentum"],
        @"Bob":@[
                @"Vivamus cursus libero a sem venenatis luctus. Nam eu turpis nulla. Maecenas sagittis quam ac porttitor varius. Vestibulum semper fringilla augue, nulla",
                @"Maecenas ullamcorper sit amet arcu ut semper. Donec vel turpis sed tellus egestas condimentum"],
        @"Charlie":@[
                @"Vivamus cursus libero a sem venenatis luctus. Nam eu turpis nulla. Maecenas sagittis quam ac porttitor varius. Vestibulum semper fringilla augue, nulla",
                @"Maecenas ullamcorper sit amet arcu ut semper. Donec vel turpis sed tellus egestas condimentum"],
        @"Chimney":@[
                @"Sed condimentum nulla tellus, sed vestibulum diam efficitur vitae. Mauris volutpat luctus lorem eget convallis. Maecenas tristique placerat ",
                @"Mauris neque justo, blandit at condimentum id, cursus quis neque. In hac habitasse platea dictumst. Donec molestie orci a nibh "],
        @"Chick":@[
                @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut neque mi, maximus a posuere vitae, ornare vitae quam. Proin ullamcorper erat a eros",
                @"Nunc congue gravida felis pharetra volutpat. Vivamus fringilla faucibus efficitur"],
    };
    
    //food Label
    _foodName_Label.text = foodName;
    
    
    //food Image
    foodImage = foodImage_Dictionary[foodName]; // take the key and get the value of that name
    _foodImage_ImageView.image = [UIImage imageNamed:foodImage];
    
    //food Ingredeient TextField
    _ingre_howToCook_TextView.text = food_IngredientDetails_HowToCook_Dictionary[foodName][1]; // 1 represent for the ingredient details
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




// TESTING
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//}

@end
