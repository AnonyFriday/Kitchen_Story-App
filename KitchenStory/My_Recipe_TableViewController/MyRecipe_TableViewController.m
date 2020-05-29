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

@end

@implementation MyRecipe_TableViewController
@synthesize listOfFood_Name;
@synthesize listOfFood_Image;
@synthesize listOfHeader_Title;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    listOfHeader_Title = @[@"A", @"B", @"C"];
    listOfFood_Name = @[
        @[@"Ann", @"Ashley"],
        @[@"Bill", @"Billy", @"Bob"],
        @[@"Charlie", @"Chimney", @"Chick"]];
    listOfFood_Image = @[
        @[@"image_1",@"image_2"],
        @[@"image_2",@"image_3",@"image_4"],
        @[@"image_4",@"image_5",@"image_6"],];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return [listOfHeader_Title count];
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [listOfFood_Name[section] count];
}

//numbero of header in the list
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return listOfHeader_Title[section];
}

//event- handling the item
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
    
    //name of the food
    NSString *itemClick = listOfFood_Name[indexPath.section][indexPath.row];
    vc.foodName = itemClick;
    
    
    //[vc setModalPresentationStyle: UIModalPresentationFullScreen];
    [self presentViewController:vc animated:YES completion:nil];
    
    
};



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SingleIdentifier" forIndexPath:indexPath];

    // Configure the cell...
    
    // Name of Food
    cell.textLabel.text = listOfFood_Name[indexPath.section]
    [indexPath.row]; // give you the dynamically row
    
    
    // Name of Image
    UIImage *image = [UIImage imageNamed:listOfFood_Image[indexPath.section][indexPath.row]];
    
    cell.imageView.image = image;

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
