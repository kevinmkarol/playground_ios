//
//  myList.m
//  playground2014
//
//  Created by Kevin Karol on 5/26/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "myList.h"

@implementation myList

@synthesize showArray;

-(id) init{
    if(self = [super init]){
        showArray = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
