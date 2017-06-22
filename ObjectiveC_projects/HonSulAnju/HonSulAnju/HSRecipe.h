//
//  HSRecipe.h
//  HonSulAnju
//
//  Created by 박종찬 on 2017. 3. 9..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HSRecipeTime){
    HSRecipeTimeTo5Min, // =@"5분 미만"
    HSRecipeTimeTo10Min,
    HSRecipeTimeTo15Min,
    HSRecipeTimeTo20Min,
    HSRecipeTimeOver20Min
};

typedef NS_ENUM(NSUInteger, HSRecipeCost) {
    HSRecipeCostTo2000Won,
    HSRecipeCostTo5000Won,
    HSRecipeCostTo10000Won,
    HSRecipeCostOver10000Won
};

typedef NS_ENUM(NSUInteger, HSDirnkPrefer) {
    HSDirnkPreferNone,
    HSDirnkPreferGood,
    HSDirnkPreferBetter
};

@interface HSRecipe : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) HSRecipeTime time;
@property (nonatomic) HSRecipeCost cost;
@property (nonatomic) NSDictionary *drinkDict;
@property (nonatomic) NSArray *ingrediantsArr;
@property (nonatomic) NSArray *detailArr;
@property (nonatomic) NSString *imageName;


@end
