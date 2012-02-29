//
//  MySecondClass.m
//  Assignment1
//
//  Created by ZacharyChen on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MySecondClass.h"

@implementation MySecondClass

-(Class)myClass{
    return myClass;
}

-(void)setMyClass:(Class)inMyClass{
    myClass = inMyClass;
}

-(void)sayHello{
    NSLog(@"%@", @"Hello");
}

+(void)staticSayHello{
    NSLog(@"%@", @"Static Hello");
}

@end
