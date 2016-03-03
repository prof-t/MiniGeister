//
//  GamePiece.m
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

#import "GamePiece.h"

static NSInteger const MyPiece1Tag = 201;
static NSInteger const MyPiece2Tag = 202;
static NSInteger const EnemyPiece1Tag = 301;
static NSInteger const EnemyPiece2Tag = 302;


@interface GamePiece()

@end


@implementation GamePiece

- (void)settingMyPieceWithView:(UIView *)view startCellFirstView:(UIView *)startCellView startCellSecondView:(UIView *)startCellSecondView
{
    //　自コマの生成
    self.myPiece1 = [self createGemePieceWithView:view color:[UIColor redColor] tag:MyPiece1Tag];
    self.myPiece2 = [self createGemePieceWithView:view color:[UIColor blueColor] tag:MyPiece2Tag];
    
    self.myPiece1.tag = MyPiece1Tag;
    self.myPiece2.tag = MyPiece2Tag;
    
    [self locatePieceWithCellView:startCellView piece:self.myPiece1];
    [self locatePieceWithCellView:startCellSecondView piece:self.myPiece2];
}


- (void)settingEnemyPieceWithView:(UIView *)view startCellView:(UIView *)startCellView startCellSecondView:(UIView *)startCellSecondView
{
    //　敵コマの生成
    self.enemyPiece1 = [self createGemePieceWithView:view color:[UIColor whiteColor] tag:EnemyPiece1Tag];
    self.enemyPiece2 = [self createGemePieceWithView:view color:[UIColor whiteColor] tag:EnemyPiece2Tag];
    
    self.enemyPiece1.tag = EnemyPiece1Tag;
    self.enemyPiece2.tag = EnemyPiece2Tag;
    
    [self locatePieceWithCellView:startCellView piece:self.enemyPiece1];
    [self locatePieceWithCellView:startCellSecondView piece:self.enemyPiece2];
}

// コマの生成
-(UIView *)createGemePieceWithView:(UIView *)view color:(UIColor *)color tag:(NSInteger)tag
{
    UIView *pieceBaseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    pieceBaseView.backgroundColor = [UIColor clearColor];
    UIView *pieceCircleView = [[UIView alloc]initWithFrame:pieceBaseView.frame];
    pieceCircleView.alpha = 0.5;
    pieceCircleView.layer.cornerRadius = pieceBaseView.frame.size.width * 0.5;
    pieceCircleView.backgroundColor = color;
    pieceBaseView.tag = tag;
    pieceCircleView.tag = tag;
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
