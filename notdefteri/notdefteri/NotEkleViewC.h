//
//  NotEkleViewC.h
//  
//
//  Created by 2015 on 15.09.2015.
//
//

#import <UIKit/UIKit.h>
#import "NotDefteriTableVC.h"
#import "Not.h"


@interface NotEkleViewC : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *NotEkle;

@property (nonatomic,strong) Not *YeniNot;

@property (nonatomic, strong) NSString *gosterilecekData;
@property (nonatomic) NSInteger gosterilecekDataSira;



- (IBAction)KaydetButon:(id)sender;





@end
