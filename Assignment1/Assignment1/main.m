//
//  main.m
//  Assignment1
//
//  Created by ZacharyChen on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "MySecondClass.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        MyClass *myClass = [[MyClass alloc]init];
        
        [myClass setTarget:[[MySecondClass alloc]init]];
        [myClass setAction:@selector(sayHello)];
        [myClass execute];
        
        [MySecondClass performSelector:@selector(staticSayHello)];
    }
    
    return 0;
}

