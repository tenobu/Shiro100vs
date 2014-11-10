//
//  RankingViewController.m
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "RankingViewController.h"

#import "Webreturn.h"
#import "SampleTableViewCell.h"

@interface RankingViewController ()
{

@private

	NSArray *array;

}

@end

@implementation RankingViewController

- (void)viewDidLoad
{

	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	//tableviewのデリゲート、データソースを自分自身にする
	self.tableView.delegate   = self;
	self.tableView.dataSource = self;
	
	//城の情報の配列を格納(配列の順番は、番号が大きくなるたびにランクが下がるようになっている)
	array = [Webreturn serverdata:@"http://smartshinobu.miraiserver.com/shiro/shirorank.php"];

}

- (void)didReceiveMemoryWarning
{

	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.

}

//テーブルのセルの数を返すためのメソッド
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return array.count;
}

//テーブルのセクションの数を返すためのメソッド
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}


//テーブルのセルの内容を返すメソッド
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSString *cellinentifier = @"samplecell";
	//samplecellという印がついた再利用可能なセルを格納
	
	SampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"samplecell"];
	//セルが再利用できないかどうか
	if (!cell) {
		NSLog(@"新規作成");
		cell = [[SampleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellinentifier];
	}
	//arrayの[indexpath.row]番目の要素((indexpath.row+1)位の城に関する情報)を格納
	NSDictionary *dic = array[indexPath.row];
	//ranklabelを「(indexPath.row+1)位」表示するに設定
	cell.ranklabel.text = [NSString stringWithFormat:@"第%ld位",indexPath.row+1];
	//shirolabelを城の名前を表示するように設定
	cell.shirolabel.text = [dic objectForKey:@"shironame"];
	//タグの投稿数の文字列を格納
	NSString *tagcount = [dic objectForKey:@"tagcount"];
	//ブロックに関する文字列を格納
	NSString *block = [dic objectForKey:@"block"];
	//taglabelをブロックとタグの投稿数を表示するように設定
	cell.taglabel.text = [NSString stringWithFormat:@"ブロック:%@ タグの投稿数:%@",block,tagcount];
	return cell;
}

- (CGFloat)   tableView: (UITableView *)tableView
heightForRowAtIndexPath: (NSIndexPath *)indexPath
{
	
	return 112;
	
}

@end
