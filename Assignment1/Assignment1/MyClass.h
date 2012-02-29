//
//  MyClass.h
//  Assignment1
//
//  Created by ZacharyChen on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject{
    id target;
    SEL action;
}

//@property (assign) id target;
//@property (assign) SEL action;

-(id)target;
-(SEL)action;
-(void)setTarget:(id)inTarget;
-(void)setAction:(SEL)inAction;
-(void)execute;

@end
