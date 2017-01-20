//
//  Matiere.m
//  
//
//  Created by rihab on 11/24/16.
//
//

#import "Matiere.h"
@interface Matiere ()

@end

@implementation Matiere
//constructeur
-(id)initMatiereWithName:(NSString*)name withCoef:(NSString*) coef withNote:(NSString*) note{
    if(self ==[super init])
    {
        self.name=name;
        self.note=note;
        self.coef=coef;
    }
    return self;
}

//add Matiere
-(void)addMatiereToList:(NSMutableArray*)list{
    [list addObject:self];}@end
