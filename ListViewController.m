//
//  ListViewController.m
//  
//
//  Created by rihab on 11/24/16.
//
//

#import "ListViewController.h"
#import "MatiereViewController.h"
#import "MySimpleTableCell.h"
#import "MoyenneViewController.h"
#import "AppDelegate.h"
#import "Matiere.h"
@interface ListViewController ()

@end


@implementation ListViewController
@synthesize json,arrayMatiere,matiereTableView;
- (void)viewDidLoad {
    
        [super viewDidLoad];
    [self fetchJson];

    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ajouterClick:(id)sender{
    
    MatiereViewController* matiereView = [self.storyboard instantiateViewControllerWithIdentifier:@"MatiereViewController"];
    [self.navigationController pushViewController:matiereView animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayMatiere.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString* simpleTableIdentifier=@"MySimpleTableCell";
    MySimpleTableCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell ==nil){
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        
        cell=[nib objectAtIndex:0];
        
    }
    Matiere* mat =[arrayMatiere objectAtIndex:indexPath.row];

    cell.nomMt.text = mat.name;
    cell.note.text = mat.note;
    cell.coeff.text =mat.coef;
    float x=[mat.note floatValue];
    float y=[mat.coef floatValue];
    float z =x*y;
    _somceof+=[mat.coef floatValue];
    _moy=_moy+z;
    
      return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        Matiere* mat =[arrayMatiere objectAtIndex:indexPath.row];
      
        NSString *url = [NSString stringWithFormat:@"http://192.168.171.2/webservice/delete.php?nom=%@&coff=%@&note=%@",mat.name,mat.coef,mat.note];
        NSLog(url);

        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        NSMutableData *body = [NSMutableData data];
        [request setHTTPBody:body];
        NSData *dataurl = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:nil];
        _somceof-=[mat.coef floatValue];
        _moy=_moy-([mat.note floatValue]*[mat.coef floatValue]);
        [arrayMatiere removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
        NSString *strresult = [[NSString alloc]initWithData:dataurl encoding:NSUTF8StringEncoding];
      
       
        
        
        
    }
}


-(void) fetchJson{
    
        NSData *jsonData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:@"http://192.168.171.2/webservice/liste.php"]];
    
    
        
        
        json=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    arrayMatiere = [[NSMutableArray alloc]init];
        
    for(int i =0;i<json.count;i++){
        
        NSString  *name=[[json objectAtIndex:i] objectForKey:@"nom"];
        NSString  *note=[[json objectAtIndex:i] objectForKey:@"note"];
        NSString  *coef=[[json objectAtIndex:i] objectForKey:@"coff"];
        Matiere* mat = [[Matiere alloc] initMatiereWithName:name withCoef:coef withNote:note];
        [arrayMatiere addObject:mat];
        
         }
    
    
}

- (IBAction)moyClick:(id)sender{
    
    MoyenneViewController* moyview = [self.storyboard instantiateViewControllerWithIdentifier:@"MoyenneViewController"];
    moyview.moycal=(_moy)/(_somceof);
    [self.navigationController pushViewController:moyview animated:YES];
}




@end
