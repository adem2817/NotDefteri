//
//  NotEkleViewC.m
//  
//
//  Created by 2015 on 15.09.2015.
//
//

#import "NotEkleViewC.h"
#import "NotDefteriTableVC.h"

@interface NotEkleViewC ()

@end

@implementation NotEkleViewC{
    
   NSMutableArray *NotListe;
}

@synthesize gosterilecekData = _gosterilecekData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSUserDefaults *saved = [NSUserDefaults standardUserDefaults];
   
    NotListe = [[saved objectForKey:@"NOT2"] mutableCopy];
    
    if(NotListe.count == 0){
        
        NotListe = [[NSMutableArray alloc] init];
        [saved setObject:NotListe forKey:@"NOT2"];
        [saved synchronize];
    
        
    }
    
    _NotEkle.text = _gosterilecekData;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)KaydetButon:(id)sender {
    
    NSUserDefaults *saved = [NSUserDefaults standardUserDefaults];
    
    
    _YeniNot = [[Not alloc] init];
    
    _YeniNot.notValue = _NotEkle.text;
    
    if(_gosterilecekDataSira < NotListe.count){
        //count dan küçükse cell deki değeri değiştirmek için kullanılır.
        
        
        
        NSMutableDictionary *notDictionary = [[NSMutableDictionary alloc ]initWithObjectsAndKeys:_YeniNot.notValue, @"Not"
                                              , nil];
        
        [NotListe replaceObjectAtIndex:_gosterilecekDataSira withObject:notDictionary];
        
    }
    else {
    
        
        // yeni data girileceği zaman çalışır.
        
        NSMutableDictionary *notDictionary = [[NSMutableDictionary alloc ]initWithObjectsAndKeys:_YeniNot.notValue, @"Not"
          , nil];
        
         [NotListe addObject:notDictionary];
        
    }
 //_yeninot Not clasından oluşan bi obje olduğundan .notvalue ekledik
 // class ları büyük harfle metodları ve obje isimlerini küçük harfle başla
    
    
   
    
    [saved setObject:NotListe forKey:@"NOT2"];
    [saved synchronize];
    //son olarak da save lenir.
}
    

@end
