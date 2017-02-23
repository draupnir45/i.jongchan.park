//
//  PokemonDataSource.h
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 22..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PokemonDataSingleton : NSObject 

@property (readonly, nonatomic, retain) NSArray *pokemonName;
@property (readonly, nonatomic, retain) NSArray *pokemonDescription;
@property (nonatomic, retain) NSMutableArray *favoritePokemon;

+ (instancetype)sharedData;


@end
