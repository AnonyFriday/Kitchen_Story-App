//
//  MyRecipe_TableViewController.m
//  KitchenStory
//
//  Created by Vu Kim Duy on 27/5/20.
//  Copyright © 2020 USER1. All rights reserved.
//

#import "MyRecipe_TableViewController.h"
#import "ViewController_showItem.h"

@interface MyRecipe_TableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableViewOfRecipe;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation MyRecipe_TableViewController
@synthesize listOfFood_Name;
@synthesize listOfFood_Image;
@synthesize listOfHeader_Title;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    isEditingTableView = FALSE;

    listOfHeader_Title = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
    
    //Dimension array
    listOfFood_Name = [[NSMutableArray alloc] initWithCapacity:3];
    [listOfFood_Name insertObject:[NSMutableArray arrayWithObjects:@"Ann", @"Ashley", nil] atIndex:0] ;
    [listOfFood_Name insertObject:[NSMutableArray arrayWithObjects:@"Bill", @"Billy", @"Bob", nil] atIndex:1] ;
    [listOfFood_Name insertObject:[NSMutableArray arrayWithObjects:@"Charlie", @"Chimney", @"Chick", nil] atIndex:2];
    
//    listOfFood_Image = @[
//        @[@"image_1",@"image_2"],
//        @[@"image_2",@"image_3",@"image_4"],
//        @[@"image_4",@"image_5",@"image_6"],];
    
    listOfFood_Image = [[NSMutableArray alloc] initWithCapacity:3];
    [listOfFood_Image insertObject:[NSMutableArray arrayWithObjects:@"image_1",@"image_2", nil] atIndex:0] ;
    [listOfFood_Image insertObject:[NSMutableArray arrayWithObjects:@"image_2",@"image_3",@"image_4", nil] atIndex:1] ;
    [listOfFood_Image insertObject:[NSMutableArray arrayWithObjects:@"image_4",@"image_5",@"image_6", nil] atIndex:2];
    
    
    
    /**TESTING Realtime DATABASE on Datasource*****************/
    self.ref = [[FIRDatabase database] reference];
    objectNSDictionaryListOfFood_TESTING = [[NSMutableDictionary alloc]init];
    
    [[_ref child:@"foods"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
      // Get user value
        //iterate everychild in the firebase
        for (FIRDataSnapshot* child in snapshot.children) {
            NSString *key = child.key;
            NSDictionary *foodDetails = child.value;
            [self->objectNSDictionaryListOfFood_TESTING setObject:foodDetails forKey:key];
        }
        
        NSLog(@"%@", self->objectNSDictionaryListOfFood_TESTING);
        [self->_tableViewOfRecipe reloadData];
      // ...
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return [listOfHeader_Title count];
    return 1;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [listOfFood_Name[section] count]; //using dynamic programming
    return [objectNSDictionaryListOfFood_TESTING count]; // using firebase
}

//numbero of header in the list // using dynamic programming
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return listOfHeader_Title[section];
//}

//event- handling the item
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*********************************************************Testing and apply with firebase**************************/
    
    
    //name of the food
   
    
    
    
    
    
    
    /**********************************************************Testing the Alert Part*****************************************/
    
//    NSLog(@"Hello at %li, %li", (long)indexPath.section, (long)indexPath.row);
//    NSLog(@"itemClicked = %@", itemClick);
    
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
//                                   message:itemClick
//                                   preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//       handler:^(UIAlertAction * action) {}];
//
//    [alert addAction:defaultAction];
//    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
    UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController_showItem *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController_showItem"];
    
        /************************************Firebase Testing********************/
    NSString *foodID = [objectNSDictionaryListOfFood_TESTING allKeys][indexPath.row];
    vc.foodName = (NSString*)[objectNSDictionaryListOfFood_TESTING valueForKey:foodID][@"name"];
    vc.foodHowToCook = (NSString*)[objectNSDictionaryListOfFood_TESTING valueForKey:foodID][@"howToCook"];
    vc.foodIngredient = (NSString*)[objectNSDictionaryListOfFood_TESTING valueForKey:foodID][@"ingredients"];
    
    

        /************************************Dynamic Programming*/
//    //name of the food
//    NSString *itemClick = listOfFood_Name[indexPath.section][indexPath.row];
//    vc.foodName = itemClick;
    
    //[vc setModalPresentationStyle: UIModalPresentationFullScreen];
    [self presentViewController:vc animated:YES completion:nil];
    
    
};

/***********************Configure**************************/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SingleIdentifier" forIndexPath:indexPath];
    
    /*********************************************************Testing and apply with firebase**************************/
    NSString *foodID = [objectNSDictionaryListOfFood_TESTING allKeys][indexPath.row];
    
    NSMutableString *foodName = [[NSMutableString alloc] init];
    [foodName appendString:[objectNSDictionaryListOfFood_TESTING valueForKey:foodID][@"name"]];
    
    
    NSLog(@"%@ food name",foodName);
        
    cell.textLabel.text = foodName;
    
    
    
    /********************************************************Dynamic Programming********************************/

//
//
//    // Name of Food
//    cell.textLabel.text = listOfFood_Name[indexPath.section]
//    [indexPath.row]; // give you the dynamically row
//
//    // Name of Image
//    UIImage *image = [UIImage imageNamed:listOfFood_Image[indexPath.section][indexPath.row]];
//
//    cell.imageView.image = image;

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

//*********************************** Deleting
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        /***********************************Firebase Version*************************/
        
        NSString *foodID = [objectNSDictionaryListOfFood_TESTING allKeys][indexPath.row]; // accessing all the keys and swipe to delete the key
        
        [[[self.ref child:@"foods"] child:foodID]
        removeValue
        ];
        
        //remove the data from dictionary
        [objectNSDictionaryListOfFood_TESTING removeObjectForKey:foodID];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        
        /************************************Dynamic Programming***********************/
//        // Delete the row from the data source
//
//        [listOfFood_Image [indexPath.section] removeObjectAtIndex:indexPath.row]; // ex: section 1, remove this row
//        [listOfFood_Name [indexPath.section]removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];

    } else if (editingStyle == UITableViewCellEditingStyleInsert) {

    }
}


- (IBAction)insertClick:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add Recipe" message:@"Enter Recipe Data"        preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"Recipe's Name";
        textField.textColor = [UIColor brownColor];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.clearButtonMode = UITextBorderStyleLine;
                
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Recipe's Description";
        textField.textColor = [UIColor brownColor];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.clearButtonMode = UITextBorderStyleRoundedRect;
        textField.secureTextEntry = TRUE;
    }];
    
    [alert addAction:[UIAlertAction
                      actionWithTitle:@"OK"
                      style:UIAlertActionStyleDefault
                      handler:^(UIAlertAction * _Nonnull action) {
        
        NSArray* textFields = alert.textFields;
        NSString* recipeName= [textFields[0] text];
        //NSString* recipeDescription = [textFields[1] text];
        
         
        int insertSectionIndex =(int) [self findSection:(NSString*)[recipeName substringToIndex:1].uppercaseString];

            
        if(insertSectionIndex == -1) {
            //adding new section to the NSMutableArray
            [self->listOfHeader_Title addObject:(NSString*)[recipeName substringToIndex:1]];
            
            insertSectionIndex = (int)[self->listOfHeader_Title count]-1; // remember index from 0 - ... i - 1 when it comes to the array
            NSLog(@"%d new Index Section", insertSectionIndex);
            
            // create new section, store new item in that new section
            
            NSLog(@"%@ header",[recipeName substringToIndex:1] );
            
            [self->listOfFood_Name insertObject:[NSMutableArray arrayWithObjects:recipeName, nil] atIndex:insertSectionIndex];
            NSLog(@"%@ name of recipe", recipeName);
            
            [self->listOfFood_Image insertObject:[NSMutableArray arrayWithObjects:@"image_4", nil] atIndex:insertSectionIndex];
            
        } else {
            [self->listOfFood_Name[insertSectionIndex] insertObject:recipeName atIndex:[self->listOfFood_Image[insertSectionIndex] count]]; // the end of the location
            [self->listOfFood_Image[insertSectionIndex] insertObject:@"image_4" atIndex:[self->listOfFood_Image[insertSectionIndex] count]];
            
        }
        //after entering the data, have to refresh the table view
        [self->_tableViewOfRecipe reloadData];
        NSLog(@"%d",insertSectionIndex);
        
        
    }]];
    
    
    [self presentViewController:alert animated:YES completion:nil];
}

// first letter of the first index of the user input
-(NSInteger)findSection:(NSString *)sectionHeaderLetter {
    int arrayHeader =(int)[listOfHeader_Title count]; // total number of header
    NSLog(@"%d",arrayHeader);
    int index = -1;
    for (int x = 0; x < arrayHeader; x++) {
        if( [sectionHeaderLetter isEqualToString:listOfHeader_Title[x]]) {
            index = x;
            
            //Testing
            NSLog(@"%d index",index);
            break;
        }
    }
    
    NSLog(@"%d indexOut",index);
    return index;
}
- (IBAction)editClicked:(id)sender {
    if( isEditingTableView == TRUE)
    {
        _editButton.title = @"Edit";
    } else {
        _editButton.title = @"Done";
    }
    
    //toggle the editbutton if it's true or false
    isEditingTableView =!isEditingTableView;
    
    [_tableViewOfRecipe setEditing:isEditingTableView];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
