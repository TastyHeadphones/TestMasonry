//
//  HeaderView.h
//  TestMasonry
//
//  Created by atom on 2022/7/31.
//
//


#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : UIView

- (instancetype)initWithCity:(NSString *)city
                 temperature:(NSString *)temperature
                         max:(NSString *)max
                         min:(NSString *)min;
@end

NS_ASSUME_NONNULL_END
