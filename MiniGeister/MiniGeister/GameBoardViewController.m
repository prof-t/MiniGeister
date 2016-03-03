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
@property (weak, nonatomic) IBOutlet UIView *cell1View;
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
@property (weak, nonatomic) IBOutlet UIView *cell13View;
@property (weak, nonatomic) IBOutlet UIView *cell14View;
@property (weak, nonatomic) IBOutlet UIView *cell15View;
@property (weak, nonatomic) IBOutlet UIView *cell16View;

@end

@implementation GameBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //マス目に境界線を付ける
    [self drawBorderLineWithView:self.cell1View];
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
    [self drawBorderLineWithView:self.cell13View];
    [self drawBorderLineWithView:self.cell14View];
    [self drawBorderLineWithView:self.cell15View];
    [self drawBorderLineWithView:self.cell16View];
    
    //　自コマの生成
    UIView *myPiece = [self createGemePiece];
    [self locatePieceWithCellView:self.cell15View piece:myPiece];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

// マス目の境界線を生成
- (void)drawBorderLineWithView:(UIView *)view
{
    view.backgroundColor = [UIColor lightGrayColor];
    //枠線
    view.layer.borderWidth = 1.5f;
    //枠線の色
    view.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    //角丸
    view.layer.cornerRadius = 10.0f;
}

// コマの生成
-(UIView *)createGemePiece
{
    UIView *pieceBaseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    pieceBaseView.backgroundColor = [UIColor clearColor];
    UIView *pieceCircleView = [[UIView alloc]initWithFrame:pieceBaseView.frame];
    pieceCircleView.alpha = 0.5;
    pieceCircleView.layer.cornerRadius = pieceBaseView.frame.size.width * 0.5;
    pieceCircleView.backgroundColor = [UIColor blueColor];
    [pieceBaseView addSubview:pieceCircleView];
    
    [self.view addSubview:pieceBaseView];
    
    return pieceBaseView;
}

// コマを配置
- (void)locatePieceWithCellView:(UIView *)cellView piece:(UIView *)piece
{
    CGRect afterRect = piece.frame;
    piece.center = cellView.center;
    afterRect.origin = CGPointMake(cellView.frame.origin.x + ((cellView.frame.size.width - piece.frame.size.width) / 2),
                                     cellView.frame.origin.y + ((cellView.frame.size.height- piece.frame.size.height) / 2));
    piece.frame = afterRect;
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
