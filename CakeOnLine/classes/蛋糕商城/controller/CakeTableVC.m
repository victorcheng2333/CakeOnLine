//
//  CakeTableVC.m
//  CakeOnLine
//
//  Created by fei on 16/5/24.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "CakeTableVC.h"
#import "ListCell.h"
#import "CakeDetailVC.h"
@interface CakeTableVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CakeTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSString *titleImageName = [NSString stringWithFormat:@"%@_title",_cakeType];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:titleImageName]];
    self.navigationItem.titleView = titleImageView;
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cakesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    NSString *imageName = [NSString stringWithFormat:@"%@_%@",_cakeType,_cakesArray[indexPath.row]];
    cell.imgView.image = [UIImage imageNamed:imageName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = _cakesArray[indexPath.row];
    if (identifier.length > 0) {
        CakeDetailVC *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CakeDetailVC"];
        detailVC.identifier = identifier;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}


@end
