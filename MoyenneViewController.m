//
//  MoyenneViewController.m
//  
//
//  Created by rihab on 11/26/16.
//
//

#import "MoyenneViewController.h"

@interface MoyenneViewController ()

@end

@implementation MoyenneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     moyenne.text=  [NSString stringWithFormat:@"%.2f",_moycal];
    // Do any additional setup after loading the view.
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

@end
