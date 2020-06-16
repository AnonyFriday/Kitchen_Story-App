//
//  ViewController_showItem.h
//  KitchenStory
//
//  Created by Vu Kim Duy on 23/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController_showItem : UIViewController {
    
    /*****************************************Firebase Testing***************************************/
    BOOL isIngreButton;
    
    
    
    /***************************************Dynamic Programming*********************************/
//    NSDictionary *foodImage_Dictionary;
//    NSDictionary *food_IngredientDetails_HowToCook_Dictionary;
};

@property (nonatomic, strong) NSString *foodName;
@property (nonatomic, strong) NSString *foodImage;
@property (nonatomic, strong) NSString *foodIngredient;
@property (nonatomic, strong) NSString *foodHowToCook;
-(void)onButtonClick:(id)sender;

@end

NS_ASSUME_NONNULL_END
