//
//  SampleTableViewCell.h
//  tablesample
//
//  Created by ビザンコムマック０７ on 2014/11/05.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SampleTableViewCell : UITableViewCell
//ランキング何位かを表示するためのラベル
@property (weak, nonatomic) IBOutlet UILabel *ranklabel;
//城の名前を表示するためのラベル
@property (weak, nonatomic) IBOutlet UILabel *shirolabel;
//タグの投稿数を表示するためのラベル
@property (weak, nonatomic) IBOutlet UILabel *taglabel;

@end
