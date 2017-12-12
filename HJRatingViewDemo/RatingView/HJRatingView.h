//
//  HJRatingView.h
//  HJRatingViewDemo
//
//  Created by WHJ on 2017/11/10.
//  Copyright © 2017年 WHJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger, HJRatingViewOperationType) {
    HJRatingViewOperationType_click = 1 << 0,      //点击
    HJRatingViewOperationType_dragInteger = 1 << 1,//拖拽整数
    HJRatingViewOperationType_dragFloat = 1 << 2   //拖拽小数
};



@interface HJRatingView : UIView

/** 最高评分 */
@property (nonatomic, assign) CGFloat maxScore;
/** 当前评分 */
@property (nonatomic, assign, readonly) CGFloat currentScore;
/** 评分改变回调 */
@property (nonatomic, copy) void(^scoreChangedBlock)(CGFloat score);
/** 支持操作类型 */
@property (nonatomic, assign) HJRatingViewOperationType operationTypes;
/** 单元背景色 */
@property (nonatomic, strong) UIColor *itemBGColor;


- (instancetype)initWithItemWidth:(CGFloat)width margin:(CGFloat)margin;

- (void)setBgImageName:(NSString *)bgImageName andTopImageName:(NSString *)topImageName;

- (void)setOrigin:(CGPoint)origin;



@end


@interface HJBaseItemView : UIView

@property (nonatomic, assign) CGFloat itemW;

@property (nonatomic, assign) CGFloat margin;

@property (nonatomic, strong) NSMutableArray *imgVs;

@property (nonatomic, assign) HJRatingViewOperationType operationTypes;

/** 单元背景色 */
@property (nonatomic, strong) UIColor *itemBGColor;

/** 评分改变回调 */
@property (nonatomic, copy) void(^scoreChangedBlock)(CGFloat score);

- (instancetype)initWithItemWidth:(CGFloat)width margin:(CGFloat)margin;

- (void)setImageName:(NSString *)imageName;

- (void)changeFrameWithPoint:(CGPoint)point;


@end



