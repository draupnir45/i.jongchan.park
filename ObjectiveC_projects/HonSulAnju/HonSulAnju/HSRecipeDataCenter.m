//
//  HSRecipeDataCenter.m
//  HonSulAnju
//
//  Created by 박종찬 on 2017. 3. 9..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "HSRecipeDataCenter.h"
#import "HSRecipe.h"

@implementation HSRecipeDataCenter

+(instancetype)sharedRecipes {
    static HSRecipeDataCenter *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HSRecipeDataCenter alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //레시피 가져오는 코드 필요.
    }
    return self;
}

@end
