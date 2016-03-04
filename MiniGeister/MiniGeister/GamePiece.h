//
//  GamePiece.h
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface GamePiece : UIView

// 自コマ
@property (nonatomic,strong) UIView *myPiece1;
@property (nonatomic,strong) UIView *myPiece2;
@property (nonatomic,strong) UIView *myPiece3;
@property (nonatomic,strong) UIView *myPiece4;

// 敵コマ
@property (nonatomic,strong) UIView *enemyPiece1;
@property (nonatomic,strong) UIView *enemyPiece2;
@property (nonatomic,strong) UIView *enemyPiece3;
@property (nonatomic,strong) UIView *enemyPiece4;

// 自コマの初期設定を行う
- (void)settingMyPieceWithView:(UIView *)view startCellFirstView:(UIView *)startCellView startCellSecondView:(UIView *)startCellSecondView;

// 敵コマの初期設定を行う
- (void)settingEnemyPieceWithView:(UIView *)view startCellView:(UIView *)startCellView startCellSecondView:(UIView *)startCellSecondView;

// コマの移動
- (void)locatePieceWithCellView:(UIView *)cellView piece:(UIView *)piece;

@end
