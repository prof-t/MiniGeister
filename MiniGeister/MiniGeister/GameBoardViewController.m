//
//  GameBoardViewController.m
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

#import "GameBoardViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GameBoardViewController ()

// 盤上のマス目を表すView群
@property (weak, nonatomic) IBOutlet UIView *cell1view;
@property (weak, nonatomic) IBOutlet UIView *cell2View;
@property (weak, nonatomic) IBOutlet UIView *cell3View;
@property (weak, nonatomic) IBOutlet UIView *cell4View;
@property (weak, nonatomic) IBOutlet UIView *cell5View;
@property (weak, nonatomic) IBOutlet UIView *cell6View;
@property (weak, nonatomic) IBOutlet UIView *cell7View;
@property (weak, nonatomic) IBOutlet UIView *cell8View;
@property (weak, nonatomic) IBOutlet UIView *cell9View;
@property (weak, nonatomic) IBOutlet UIView *cell10View;
@property (weak, nonatomic) IBOutlet UIView *cell11View;
@property (weak, nonatomic) IBOutlet UIView *cell12View;

@end

@implementation GameBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //マス目に境界線を付ける
    [self drawBorderLineWithView:self.cell1view];
    [self drawBorderLineWithView:self.cell2View];
    [self drawBorderLineWithView:self.cell3View];
    [self drawBorderLineWithView:self.cell4View];
    [self drawBorderLineWithView:self.cell5View];
    [self drawBorderLineWithView:self.cell6View];
    [self drawBorderLineWithView:self.cell7View];
    [self drawBorderLineWithView:self.cell8View];
    [self drawBorderLineWithView:self.cell9View];
    [self drawBorderLineWithView:self.cell10View];
    [self drawBorderLineWithView:self.cell11View];
    [self drawBorderLineWithView:self.cell12View];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)drawBorderLineWithView:(UIView *)view
{
    //枠線
    view.layer.borderWidth = 2.0f;
    //枠線の色
    view.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    //角丸
    view.layer.cornerRadius = 10.0f;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
