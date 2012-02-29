//
//  MyClass.m
//  Assignment1
//
//  Created by ZacharyChen on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

//@synthesize target;
//@synthesize action;

-(id)target{
    return target;
}

-(SEL)action{
    return action;
}

-(void)setTarget:(id)inTarget{
    target = inTarget;
}

-(void)setAction:(SEL)inAction{
    action = inAction;
}

-(void)execute{
    if ([target respondsToSelector:action]) {
        [target performSelector:action];
    }
}

@end
