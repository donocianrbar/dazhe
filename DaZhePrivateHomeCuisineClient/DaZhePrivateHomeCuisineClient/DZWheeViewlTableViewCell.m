//
//  DZWheeViewlTableViewCell.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZWheeViewlTableViewCell.h"
@implementation DZWheeViewlTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
    self.contentView.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadData:(NSArray*)models;
{
    NSMutableArray *items=[NSMutableArray array];
    if (models.count>0) {
        for(DZAlternationItemModel *model in models){
         SGFocusImageItem *item=[[SGFocusImageItem alloc] initWithTitle:nil image:nil imageUrl:[NSString stringWithFormat:@"%@/%@",API_DOMAIN,model.link] tag:0];
            [items addObject:item];
        }
    }
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height-11)
                                                                    delegate:self
                                                             focusImageItems:items];
    [self addSubview:imageFrame];
}
#pragma mark -
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    NSLog(@"%@ tapped", item.title);
}
@end
