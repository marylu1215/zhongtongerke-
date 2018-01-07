//
//  DiffPostView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "DiffPostView.h"

@interface DiffPostView ()

@property (nonatomic ,strong)  UILabel *headingLabel;

@end


@implementation DiffPostView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)setForum:(Forum *)forum
{
    _forum = forum;
    
    [self.headingLabel removeFromSuperview];
    
   self.headingLabel = [UILabel addLabelWithText: forum.title AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview: self.headingLabel];
    
    if (forum.is_top) {
        
        UIImageView *topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top"]];
        [self addSubview: topImageView];
        
       topImageView.sd_layout.widthIs(topImageView.image.size.width).heightIs(topImageView.image.size.height).leftSpaceToView(self ,px(30)).centerYEqualToView(self);
        
        if (forum.is_cream) {
            
            UIImageView *greatImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Essence"]];
            [self addSubview:greatImageView];
            
             greatImageView.sd_layout.widthIs(greatImageView.image.size.width).heightIs(greatImageView.image.size.height).leftSpaceToView(topImageView ,px(10)).centerYEqualToView(topImageView);
            
           self.headingLabel.sd_layout.leftSpaceToView( greatImageView,px(10)).heightIs(Font13).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        }
        
        else
        {
           self.headingLabel.sd_layout.leftSpaceToView( topImageView,px(10)).heightIs(Font13).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        }

    }
    
    else
    {
        
        if (forum.is_cream) {
            
            UIImageView *greatImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Essence"]];
            [self addSubview:greatImageView];
            
            greatImageView.sd_layout.widthIs(greatImageView.image.size.width).heightIs(greatImageView.image.size.height).leftSpaceToView(self ,px(30)).centerYEqualToView(self);
            
           self.headingLabel.sd_layout.leftSpaceToView( greatImageView,px(10)).heightIs(Font13).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        }
        
        else
        {
          self.headingLabel.sd_layout.leftSpaceToView(self,px(30)).heightIs(Font13).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        }

    }
    
}

-(void)setReplyNote:(ReplyNote *)replyNote
{
    
    [self.headingLabel removeFromSuperview];
    
    self.headingLabel = [UILabel addLabelWithText:replyNote.title AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview: self.headingLabel];
    
    if (replyNote.is_top) {
        
        UIImageView *topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ltTopImageName]];
        [self addSubview: topImageView];
        
        topImageView.sd_layout.widthIs(topImageView.image.size.width).heightIs(topImageView.image.size.height).leftSpaceToView(self ,px(30)).centerYEqualToView(self);
        
        if (replyNote.is_cream) {
            
            UIImageView *greatImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:essenceImageName]];
            [self addSubview:greatImageView];
            
            greatImageView.sd_layout.widthIs(greatImageView.image.size.width).heightIs(greatImageView.image.size.height).leftSpaceToView(topImageView ,px(10)).centerYEqualToView(topImageView);
            
            self.headingLabel.sd_layout.leftSpaceToView( greatImageView,px(10)).heightIs(Font13).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        }
        
        else
        {
            self.headingLabel.sd_layout.leftSpaceToView( topImageView,px(10)).heightIs(Font13).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        }
        
    }
    
    else
    {
        
        if (replyNote.is_cream) {
            
            UIImageView *greatImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:essenceImageName]];
            [self addSubview:greatImageView];
            
            greatImageView.sd_layout.widthIs(greatImageView.image.size.width).heightIs(greatImageView.image.size.height).leftSpaceToView(self ,px(30)).centerYEqualToView(self);
            
            self.headingLabel.sd_layout.leftSpaceToView( greatImageView,px(10)).heightIs(Font13).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        }
        
        else
        {
            self.headingLabel.sd_layout.leftSpaceToView(self,px(30)).heightIs(Font13).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        }
        
    }

}
@end
