//
//  GamePiece.m
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

#import "GamePiece.h"

@implementation GamePiece

- (void)settingMyPieceWithView:(UIView *)view startCellView:(UIView *)startCellView
{
    //　自コマの生成
    self.myPiece1 = [self createGemePieceWithView:view color:[UIColor redColor]];
    self.myPiece2 = [self createGemePieceWithView:view color:[UIColor blueColor]];
    
    [self locatePieceWithCellView:view piece:self.myPiece1];
    [self locatePieceWithCellView:view piece:self.myPiece2];
}


- (void)settingEnemyPieceWithView:(UIView *)view startCellView:(UIView *)startCellView
{
    
    //　敵コマの生成
}

// コマの生成
-(UIView *)createGemePieceWithView:(UIView *)view color:(UIColor *)color
{
    UIView *pieceBaseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    pieceBaseView.backgroundColor = [UIColor clearColor];
    UIView *pieceCircleView = [[UIView alloc]initWithFrame:pieceBaseView.frame];
    pieceCircleView.alpha = 0.5;
    pieceCircleView.layer.cornerRadius = pieceBaseView.frame.size.width * 0.5;
    pieceCircleView.backgroundColor = color;
    [pieceBaseView addSubview:pieceCircleView];
    
    [view addSubview:pieceBaseView];
    
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

@end
