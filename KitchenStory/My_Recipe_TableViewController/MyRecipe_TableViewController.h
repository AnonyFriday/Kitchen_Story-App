//
//  MyRecipe_TableViewController.h
//  KitchenStory
//
//  Created by Vu Kim Duy on 27/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyRecipe_TableViewController : UITableViewController {
    bool isEditingTableView;
}
@property (nonatomic, strong) NSMutableArray *listOfFood_Name;
@property (nonatomic, strong) NSMutableArray *listOfFood_Image;
@property (nonatomic, strong) NSMutableArray *listOfHeader_Title;


-(NSInteger)findSection:(NSString*)sectionHeaderLetter;
@end



NS_ASSUME_NONNULL_END
