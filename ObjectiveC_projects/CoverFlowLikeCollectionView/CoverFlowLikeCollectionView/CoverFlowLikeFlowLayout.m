//
//  CoverFlowLikeFlowLayout.m
//  CoverFlowLikeCollectionView
//
//  Created by 박종찬 on 2017. 3. 22..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CoverFlowLikeFlowLayout.h"

@implementation CoverFlowLikeFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *originalAttributesArray = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray *changedAttributesArray = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attribute in originalAttributesArray) {
        UICollectionViewLayoutAttributes *changedAttribute = [attribute copy];
        [self changeAttribute:changedAttribute];
        
        [changedAttributesArray addObject:changedAttribute];
    }
    
    
    return changedAttributesArray;
}

- (void)changeAttribute:(UICollectionViewLayoutAttributes *)attribute {
    
    CGFloat collectionViewCenter = self.collectionView.center.x;
    CGFloat contentXOffset = self.collectionView.contentOffset.x;

    CGFloat visibleContentXOffset = collectionViewCenter + contentXOffset;
    
    CGFloat itemRelatedWidth = self.itemSize.width + self.minimumLineSpacing;
    CGFloat itemDistanceFromVisibleCenter = fabs(visibleContentXOffset - attribute.center.x);
    CGFloat itemDistance = MIN(itemRelatedWidth, itemDistanceFromVisibleCenter);
    
    CGFloat changingRatio = (itemRelatedWidth - itemDistance) / itemRelatedWidth;
    
    CGFloat itemScale = (changingRatio * 0.2f) + 1.0f;
    CGFloat itemAlpha = (changingRatio * 0.2f) + 0.8f;
    
    attribute.alpha = itemAlpha;
    attribute.transform3D = CATransform3DScale(CATransform3DIdentity, itemScale, itemScale, -itemScale*0.1);
    attribute.zIndex = 10 * itemAlpha;
//    attribute.center = CGPointMake(attribute.center.x, attribute.center.y / (itemScale / 2.0f));
    
    
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGFloat proposedXOffsetCenter = proposedContentOffset.x + self.collectionView.frame.size.width / 2.0f;
    
    NSArray *attributeArray = [self layoutAttributesForElementsInRect:self.collectionView.bounds];
    
    NSArray *resultArray = [attributeArray sortedArrayUsingComparator:^NSComparisonResult(UICollectionViewLayoutAttributes * _Nonnull obj1, UICollectionViewLayoutAttributes *  _Nonnull obj2) {
        if (fabs(obj1.center.x - proposedXOffsetCenter) > fabs(obj2.center.y - proposedXOffsetCenter)) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
        
    }];
    
    CGFloat targetXOffset = [resultArray.firstObject center].x - self.collectionView.frame.size.width / 2.0f;

    return CGPointMake(targetXOffset, proposedContentOffset.y);
}



@end
