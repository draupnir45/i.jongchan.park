//
//  Annotation.h
//  MapPrac
//
//  Created by 박종찬 on 2017. 3. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject
<MKAnnotation>

@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic) CLLocationCoordinate2D coordinate;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
@end
