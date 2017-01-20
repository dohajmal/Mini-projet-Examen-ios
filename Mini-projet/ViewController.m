//
//  ViewController.m
//  Mini-projet
//
//  Created by doha on 2016-10-30.
//  Copyright (c) 2016 doha. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"
@interface ViewController ()

@end

@implementation ViewController

 //image2iew.image=[UIImage imageNamed:@"125897.png"];
- (void)viewDidLoad {
    [super viewDidLoad];
    image2iew.image=[UIImage imageNamed:@"125897.png"];

    
   int random=(int)(arc4random()% 899)+100;
    NSString *myCode=[NSString stringWithFormat:@"%d",random];
    //String rand=random
    code.text=myCode;
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)codeClick:(id)sender{
    
    if ([code.text isEqualToString:codeverif.text])
    {
      
        ListViewController* listView = [self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
        [self.navigationController pushViewController:listView animated:YES];
        //message.text=@"Login correct";
    }else
    {
        message.text=@"Login incorrect";
    }
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
