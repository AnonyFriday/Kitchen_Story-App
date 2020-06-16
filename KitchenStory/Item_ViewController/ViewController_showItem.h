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
    NSDictionary *foodImage_Dictionary;
    NSDictionary *food_IngredientDetails_HowToCook_Dictionary;
//    NSDictionary *food_HowToMake_Dictionary;
};

@property (nonatomic, strong) NSString *foodName;
@property (nonatomic, strong) NSString *foodImage;


@end

NS_ASSUME_NONNULL_END
