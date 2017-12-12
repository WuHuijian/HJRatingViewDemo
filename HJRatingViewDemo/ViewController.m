//
//  ViewController.m
//  HJRatingViewDemo
//
//  Created by WHJ on 2017/11/10.
//  Copyright © 2017年 WHJ. All rights reserved.
//

#import "ViewController.h"
#import "HJRatingView.h"

@interface ViewController ()

/** 展示分数 */
@property (nonatomic, strong) UILabel *scoreLabel;

/** 评分视图 */
@property (nonatomic, strong) HJRatingView *ratingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}


- (void)setupUI{
    
    __weak ViewController *weakSelf = self;
    
    HJRatingView *ratingView = [[HJRatingView alloc] initWithItemWidth:30 margin:5];
    [ratingView setBgImageName:@"rating_gray" andTopImageName:@"rating_yellow"];
    ratingView.center = self.view.center;
    ratingView.backgroundColor = [UIColor redColor];
    ratingView.itemBGColor = [UIColor blueColor];
    ratingView.maxScore = 10;
    ratingView.operationTypes = HJRatingViewOperationType_click | HJRatingViewOperationType_dragInteger;//设置操作类型
    ratingView.scoreChangedBlock = ^(CGFloat score) {//监控评分
        weakSelf.scoreLabel.text = [NSString stringWithFormat:@"%.1f",score];
    };
    [self.view addSubview:ratingView];
    self.ratingView = ratingView;
    
    [self setupOtherViews];
    
}



- (void)setupOtherViews{
    
    //展示评分
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    scoreLabel.center = CGPointMake(self.view.center.x, self.view.center.y+100);
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:scoreLabel];
    self.scoreLabel = scoreLabel;
    
    UIButton *typeChangedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    typeChangedBtn.frame = CGRectMake(0, 0, 300, 40);
    [typeChangedBtn setBackgroundColor:[UIColor grayColor]];
    [typeChangedBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [typeChangedBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [typeChangedBtn setTitle:@"打开 点击 和 拖拽整数 评分" forState:UIControlStateNormal];
    [typeChangedBtn setTitle:@"打开 点击 和 拖拽小数 评分" forState:UIControlStateSelected];
    [typeChangedBtn addTarget:self action:@selector(typeChanged:) forControlEvents:UIControlEventTouchUpInside];
    typeChangedBtn.center = CGPointMake(self.view.center.x, self.view.center.y+200);
    [self.view addSubview:typeChangedBtn];
    
    
}

- (void)typeChanged:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    if (!sender.selected) {
        self.ratingView.operationTypes = HJRatingViewOperationType_click | HJRatingViewOperationType_dragInteger;
    }else{
        self.ratingView.operationTypes = HJRatingViewOperationType_click | HJRatingViewOperationType_dragFloat;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
