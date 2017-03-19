//
//  PostModel.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "PostModel.h"
#import "DataCenter.h"

@implementation PostModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        self.postPK = [[dict objectForKey:@"pk"] integerValue];
        self.title = [dict objectForKey:@"title"];
        self.content = [dict objectForKey:@"content"];
        if ([dict objectForKey:@"img_cover"] != [NSNull null]) {
            [[DataCenter sharedData] loadImageWithURL:[NSURL URLWithString:[dict objectForKey:@"img_cover"]] postPK:self.postPK];
        }
    }
    return self;
}

@end
