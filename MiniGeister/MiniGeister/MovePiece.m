//
//  MovePiece.m
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

#import "MovePiece.h"

@implementation MovePiece

// 現在、空いているマスを得る
- (NSArray *)getBlankCellArray
{
    return nil;
}

// 現在、埋まっているマスを得る
- (NSArray *)getFilledCellArray
{
    return nil;
}

// コマと隣接するマスの内、空いているマスを得る
- (NSArray *)getBlankCellArrayWithPiece
{
    return nil;
}

// コマと隣接するマスの内、埋まっているマスを得る
- (NSArray *)getFilledCellArrayWithPiece
{
    return nil;
}

- (NSArray *)getNeighborCellWithCurrentCellTag:(NSInteger)currentCellTag
{
    NSInteger upperCellTag = currentCellTag - 4;
    NSInteger underCellTag = currentCellTag + 4;
    

    NSInteger rightCellTag = currentCellTag + 1;
    NSInteger leftCellTag = currentCellTag - 1;
    
    if (currentCellTag  <= 100){
        upperCellTag = 88;
    }
    
    if (currentCellTag >= 119){
        underCellTag = 22;
    }
    
    if (currentCellTag == 104 || currentCellTag == 108 || currentCellTag == 112 || currentCellTag == 116){
        rightCellTag = 66;
    }
    
    if (currentCellTag == 101 || currentCellTag == 105 || currentCellTag == 109 || currentCellTag == 113){
        leftCellTag = 44;
    }
    
    NSNumber *upperCellTagNum = [NSNumber numberWithInteger:upperCellTag];
    NSNumber *underCellTagNum = [NSNumber numberWithInteger:underCellTag];

    NSNumber *leftCellTagNum = [NSNumber numberWithInteger:leftCellTag];

    NSNumber *rightCellTagNum = [NSNumber numberWithInteger:rightCellTag];

    NSArray *neighborCellTagArray = @[upperCellTagNum,underCellTagNum,leftCellTagNum,rightCellTagNum];
    
    return neighborCellTagArray;
}

// マス目の配置状況を更新する
- (void)refreshCellArray
{

}

@end
