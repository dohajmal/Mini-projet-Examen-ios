//
//  MatiereViewController.m
//  
//
//  Created by rihab on 11/24/16.
//
//

#import "MatiereViewController.h"
#import "Matiere.h"
#import "AppDelegate.h"
#import "ListViewController.h"
@interface MatiereViewController ()

@end

@implementation MatiereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)addMatiere:(id)sender{
  
   /* float x=[note.text floatValue];
    float y=[coef.text floatValue];*/
    if([name.text isEqual:@""]){
        UIAlertView *test=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Vous devez saisir un matière" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [test setTag:1];
        [test show];
    }
    else if([coef.text isEqual:@""]){
        UIAlertView *test=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Vous devez saisir un coefficient" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [test setTag:1];
        [test show];

}
else if([note.text isEqual:@""]){
    UIAlertView *test=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Vous devez saisir un note" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [test setTag:1];
    [test show];
    
}
else{
   /* Matiere* mt=[[Matiere alloc] initMatiereWithName:name.text withCoef:coef.text withNote:note.text];
    AppDelegate *appd=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    [mt addMatiereToList:appd.listMatiere];*/
    NSString *url = [NSString stringWithFormat:@"http://192.168.171.2/webservice/add.php?nom=%@&note=%@&coff=%@",name.text,note.text,coef.text];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSMutableData *body = [NSMutableData data];
    [request setHTTPBody:body];
    NSData *dataurl = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:nil];
    
    NSString *strresult = [[NSString alloc]initWithData:dataurl encoding:NSUTF8StringEncoding];
    NSLog(@"%@",strresult);
    
    ListViewController* v = [self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    [self.navigationController pushViewController:v animated:YES];
    }
       
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
