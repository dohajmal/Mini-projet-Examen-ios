//
//  Matiere.h
//  
//
//  Created by rihab on 11/24/16.
//
//

#import <Foundation/Foundation.h>

@interface Matiere : NSObject
@property(strong,nonatomic)NSString* name;
@property(strong,nonatomic)NSString* coef;
@property(strong,nonatomic)NSString* note;
//@property(strong,nonatomic)NSString* moy;
-(id)initMatiereWithName:(NSString*)name withCoef:(NSString*) coef withNote:(NSString*) note;
-(void)addMatiereToList:(NSMutableArray*) list;
@end
