//
//  ListViewController.h
//  
//
//  Created by rihab on 11/24/16.
//
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
   
   }
@property(assign,nonatomic)float moy;
@property(assign,nonatomic)float somceof;
@property(assign,nonatomic)int count;
@property(nonatomic,strong) NSMutableArray *json;
@property(nonatomic,strong) NSMutableArray *arrayMatiere;
@property(nonatomic,strong) IBOutlet UITableView *matiereTableView;

-(void) fetchJson;
@end
