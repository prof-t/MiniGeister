//
//  AlertView.h
//  StrayDogOverOne
//
//  Created by RYO on 2015/06/24.
//  Copyright (c) 2015年 RYO. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 ゲーム中断のYES/NOアラートを表示するためのクラス
 */
@interface AlertView : NSObject

/**
 初期化する
 @param title アラートのタイトル
 @param message アラートに表示するメッセージ
 @param owner ownerであるViewController
 @return コマと隣接するマスのarrayを返す
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message owner:(UIViewController *)owner;

/**
 add
 @param label アラート内に追加したいラベル
 @param handler ラベルに対応したボタンを押下した時に呼ばれるhandler
 */
- (void)addLabel:(NSString *)label handler:(void (^)(void))handler;

/**
 show
 */
- (void)show;

/**
 Alertを閉じる
*/
-(void)dismiss;

@end
