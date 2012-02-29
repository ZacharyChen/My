//
//  MySecondClass.h
//  Assignment1
//
//  Created by ZacharyChen on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySecondClass : NSObject{
    Class myClass;
}

-(id)myClass;
-(void)setMyClass:(id)inMyClass;
-(void)sayHello;
+(void)staticSayHello;

@end
