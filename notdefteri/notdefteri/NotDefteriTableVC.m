//
//  NotDefteriTableVC.m
//  
//
//  Created by 2015 on 15.09.2015.
//
//

#import "NotDefteriTableVC.h"

@interface NotDefteriTableVC ()

@end

@implementation NotDefteriTableVC{
    
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSUserDefaults *saved = [NSUserDefaults standardUserDefaults];
    
    _NotListe = [[saved objectForKey:@"NOT2"] mutableCopy];
    
    if(_NotListe.count == 0){
        
        _NotListe = [[NSMutableArray alloc] init];
        [saved setObject:_NotListe forKey:@"NOT2"];
        [saved synchronize];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return _NotListe.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NOT" forIndexPath:indexPath];
    
    cell.textLabel.text = [[_NotListe objectAtIndex:[indexPath row]] objectForKey:@"Not"];
    
    
    // Configure the cell...
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    _tempData = [[_NotListe objectAtIndex:indexPath.row] objectForKey:@"Not"];
    
    _editSira = indexPath.row;
    
    
    [self performSegueWithIdentifier:@"NOT" sender:self];
    
    

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"NOT"]){
     
        //edit yapılacağı zaman yani cell e tıklandığı zaman çalışır.
        
        
        UINavigationController *destinationController = (UINavigationController*)segue.destinationViewController;
        NotEkleViewC *notEkleViewController = (NotEkleViewC*)destinationController.topViewController;
        
        notEkleViewController.gosterilecekData = _tempData ;
        notEkleViewController.gosterilecekDataSira = _editSira;
        
        
    }
    else if([segue.identifier isEqualToString:@"yeniNot"]){
        
        //yeni not a tıklandığı zaman çalışır.
        
        
        
        UINavigationController *destinationController = (UINavigationController*)segue.destinationViewController;
        NotEkleViewC *notEkleViewController = (NotEkleViewC*)destinationController.topViewController;
        
        _editSira = _NotListe.count;
        notEkleViewController.gosterilecekDataSira = _editSira;
        
        
        
    }
    
    
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


#pragma mark - Navigation



@end
