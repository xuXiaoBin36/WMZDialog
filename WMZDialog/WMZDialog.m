//
//  WMZDialog.m
//  WMZDialog
//
//  Created by wmz on 2019/6/5.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "WMZDialog.h"

@interface WMZDialog ()
/*
 *配置
 */
@property(nonatomic,strong)NSMutableDictionary *configDic;

@end

@implementation WMZDialog

WMZDialog * Dialog(void){
    return  [WMZDialog  new];
}

- (WMZDialog * _Nonnull (^)(void))wStart{
     return ^WMZDialog*(){
         [self start];
         return self;
     };
}

WMZDialogSetFuncImplementation(WMZDialog, UIViewController* ,        wParentVC)
WMZDialogSetFuncImplementation(WMZDialog, UIView* ,                   wTapView)
WMZDialogSetFuncImplementation(WMZDialog, DialogType,                    wType)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,                wTitleColor)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,              wMessageColor)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                      wWidth)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                     wHeight)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                wMainOffsetY)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,              wMainBtnHeight)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                wMainOffsetX)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,             wDisappelSecond)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,                 wLineColor)
WMZDialogSetFuncImplementation(WMZDialog, NSString*,                  wOKTitle)
WMZDialogSetFuncImplementation(WMZDialog, NSString*,              wCancelTitle)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,                   wOKColor)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,               wCancelColor)
WMZDialogSetFuncImplementation(WMZDialog, NSString*,                    wTitle)
WMZDialogSetFuncImplementation(WMZDialog, NSString*,                  wMessage)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,            wKeyBoardMarginY)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,               wShadowColor)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                     wOKFont)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                 wCancelFont)
WMZDialogSetFuncImplementation(WMZDialog, BOOL,                  wMainToBottom)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                  wLineAlpha)
WMZDialogSetFuncImplementation(WMZDialog, id,                            wData)
WMZDialogSetFuncImplementation(WMZDialog, id,                         wSonData)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                  wTitleFont)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                wMessageFont)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                wShadowAlpha)
WMZDialogSetFuncImplementation(WMZDialog, NSInteger,                   wPayNum)
WMZDialogSetFuncImplementation(WMZDialog, BOOL,                  wShadowCanTap)
WMZDialogSetFuncImplementation(WMZDialog, BOOL,                    wShadowShow)
WMZDialogSetFuncImplementation(WMZDialog, DialogClickBlock,     wEventOKFinish)
WMZDialogSetFuncImplementation(WMZDialog, DialogClickBlock, wEventCancelFinish)
WMZDialogSetFuncImplementation(WMZDialog, NSString*,      wDefaultSelectPayStr)
WMZDialogSetFuncImplementation(WMZDialog, DialogTableClickBlock,  wEventFinish)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,             wMainBackColor)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,                 wMainRadius)
WMZDialogSetFuncImplementation(WMZDialog, NSInteger,          wWirteTextMaxNum)
WMZDialogSetFuncImplementation(WMZDialog, NSInteger,         wWirteTextMaxLine)
WMZDialogSetFuncImplementation(WMZDialog, UIKeyboardType,   wWirteKeyBoardType)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,               wPercentAngle)
WMZDialogSetFuncImplementation(WMZDialog, CGFloat,              wPercentOrginX)
WMZDialogSetFuncImplementation(WMZDialog, DiaDirection,             wDirection)
WMZDialogSetFuncImplementation(WMZDialog, diaLogCellCallBlock,         wMyCell)
WMZDialogSetFuncImplementation(WMZDialog, UIModalTransitionStyle,       wStyle)
WMZDialogSetFuncImplementation(WMZDialog, CGSize,                   wImageSize)
WMZDialogSetFuncImplementation(WMZDialog, NSString*,                wImageName)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,         wProgressTintColor)
WMZDialogSetFuncImplementation(WMZDialog, UIColor*,            wTrackTintColor)
WMZDialogSetFuncImplementation(WMZDialog, diaLogMyViewCallBlock, wMyDiaLogView)
WMZDialogSetFuncImplementation(WMZDialog, BOOL,                 wAddBottomView)
WMZDialogSetFuncImplementation(WMZDialog, NSArray* ,           wTableViewColor)
WMZDialogSetFuncImplementation(WMZDialog, DialogClickBlock,        wEventClose)
WMZDialogSetFuncImplementation(WMZDialog, DialogMenuClickBlock,wEventMenuClick)
WMZDialogSetFuncImplementation(WMZDialog, BOOL,                wNavigationItem)
WMZDialogSetFuncImplementation(WMZDialog, NSTextAlignment,      wTextAlignment)

- (instancetype)init{
    if (self = [super init]) {
        _wStyle = UIModalTransitionStyleCrossDissolve;
        _wWidth = Dialog_GetWNum(500);
        _wHeight = Dialog_GetHNum(300);
        _wDisappelSecond = 1.5f;
        _wMainBtnHeight = Dialog_GetHNum(60);
        _wParentVC = [WMZDialogTool getCurrentVC];
        _wOKTitle = @"确定";
        _wCancelTitle = @"取消";
        _wOKColor = DialogColor(0xFF9900);
        _wCancelColor = DialogColor(0x666666);
        _wMainRadius = 15.0f;
        _wMainBackColor = DialogColor(0xFFFFFF);
        _wLineColor =  DialogColor(0x333333);
        _wTitleColor = DialogColor(0x333333);
        _wMessageColor = DialogColor(0x333333);
        _wMainOffsetY = Dialog_GetHNum(20);
        _wMainOffsetX = Dialog_GetWNum(15);
        _wLineAlpha = 0.5f;
        _wTitleFont = 14.0f;
        _wMessageFont = 16.0f;
        _wOKFont = 16.0f;
        _wCancelFont = 16.0f;
        _wTitle = @"提示";
        _wMessage = @"内容";
        _wShadowAlpha = 0.4f;
        _wShadowColor = DialogColor(0x333333);
        _wKeyBoardMarginY = Dialog_GetHNum(80);
        _wPayNum = 5;
        _wDefaultSelectPayStr = @"农业银行";
        _wShadowCanTap = YES;
        _wShadowShow = YES;
        _wWirteTextMaxNum  = -1;
        _wWirteTextMaxLine = 7;
        _wPercentAngle =  0.5f;
        _wPercentOrginX = 1.0f;
        _wDirection = directionDowm;
        _wImageSize = CGSizeMake(Dialog_GetWNum(110), Dialog_GetWNum(110));
        _wImageName = @"down_tyx";
        _wProgressTintColor = DialogColor(0xFF9900);
        _wTrackTintColor = DialogColor(0xF3F4F6);
        _wTableViewColor = @[DialogColor(0xFFFFFF),DialogColor(0xF6F7FA),DialogColor(0xEBECF0),DialogColor(0xFFFFFF)];
    }
    return self;
}


/*
 *设置
 */
- (void)start{

    //设置默认宽度和默认宽度和默认圆角
    if (self.wType == DialogTypeShare||self.wType == DialogTypePickSelect||self.wType == DialogTypeSheet||self.wType == DialogTypeMenusSelect||self.wType == DialogTypeBuyCar) {
        if (self.wType!= DialogTypeMenusSelect) {
            if (self.wHeight == Dialog_GetHNum(300)) {
                self.wHeight = Dialog_GetHNum(200);
            }
            self.wMainToBottom = YES;
        }
        
        if (self.wHeight == Dialog_GetHNum(300)&&self.wType == DialogTypeShare) {
            self.wHeight = Dialog_GetHNum(200);
        }
        
        //外部若设置该属性会生效
        if (self.wMainRadius == 15.0f) {
            self.wMainRadius = 10.0f;
        }
        if (self.wWidth == Dialog_GetWNum(500)) {
            self.wWidth = Device_Dialog_Width;
        }
    }
    
    
    //设置默认宽度
    if (self.wType == DialogTypePop) {
        if (self.wWidth == Dialog_GetWNum(500)) {
            self.wWidth = Dialog_GetWNum(300);
        }
    }
    
    //设置支付默认提示语
    if (self.wType == DialogTypePay) {
        if ([self.wTitle isEqualToString:@"提示"]) {
            self.wTitle = @"请输入支付密码";
        }
        if ([self.wMessage isEqualToString:@"内容"]) {
            self.wMessage = @"￥100.00";
        }
    }
    
    //设置分享默认提示语
    if (self.wType == DialogTypeShare) {
        if ([self.wTitle isEqualToString:@"提示"]) {
            self.wTitle = @"分享到";
        }
    }
    
    //设置编辑默认提示语
    if (self.wType == DialogTypeWrite) {
        if ([self.wMessage isEqualToString:@"内容"]) {
            self.wMessage = @"请输入内容";
        }
    }
    
    //设置广告背景clear
    if (self.wType == DialogTypeAdvertisement) {
        self.wMainBackColor = [UIColor clearColor];
        self.wShadowCanTap = NO;
    }
    
    if (self.wType == DialogTypeSelect) {
         self.wMainBtnHeight+=Dialog_GetHNum(15);
    }else if (self.wType == DialogTypeSheet){
         self.wMainBtnHeight+=Dialog_GetHNum(30);
    }else if (self.wType == DialogTypeMenusSelect){
         self.wMainBtnHeight*=1.5;
    }
    

    [self setUpUI];
    
    
    if (self.wType == DialogTypeSelect || self.wType == DialogTypeSheet || self.wType == DialogTypePop|| self.wType == DialogTypeBuyCar) {
        if (self.wData&&([self.wData isKindOfClass:[NSArray class]]||[self.wData isKindOfClass:[NSMutableArray class]])) {
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
            self.tableView.estimatedSectionFooterHeight = 0.01;
            self.tableView.estimatedSectionHeaderHeight = 0.01;
            self.tableView.estimatedRowHeight = self.wMainBtnHeight;
            self.tableView.rowHeight = self.wMainBtnHeight;
        }

        if (self.wType == DialogTypeBuyCar) {
            self.tableView.scrollEnabled = YES;
        }else{
            if ([self.wData count]>8) {
                self.tableView.scrollEnabled = YES;
            }else{
                self.tableView.scrollEnabled = NO;
            }
        }
    }
    
    if (self.wType == DialogTypePickSelect) {
        if (self.wData&&([self.wData isKindOfClass:[NSArray class]]||[self.wData isKindOfClass:[NSMutableArray class]])) {
            self.pickView.delegate = self;
            self.pickView.dataSource = self;
        }
        
    }
    
    [self.view addSubview:self.mainView];

    if (self.wMyDiaLogView) {
        [self start:self.mainView];
        UIView *bottomView = self.wMyDiaLogView(self.mainView);
        if (self.wAddBottomView) {
            UIView *addBottomView  = [self addBottomView:CGRectGetMaxY(bottomView.frame)+self.wMainOffsetY];
            [self reSetMainViewFrame:CGRectMake(0, 0, self.wWidth, CGRectGetMaxY(addBottomView.frame)+self.wMainOffsetY)];
        }else{
            [self reSetMainViewFrame:CGRectMake(0, 0, self.wWidth, CGRectGetMaxY(bottomView.frame)+self.wMainOffsetY)];
        }
    }else{
        SEL sel = NSSelectorFromString(self.configDic[@(self.wType)]);
        if (!sel) return;
        SuppressPerformSelectorLeakWarning(
            id alert = [self performSelector:sel];
            [self performSelector:@selector(start:) withObject:alert];
        );
    }
  
    
}

/*
 *UI赋值
 */
- (void)setUpUI{
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]&&self.wType!=DialogTypePop) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    
    
    if (self.wType == DialogTypePay || self.wType == DialogTypeWrite) {
        //监听键盘出现
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        //监听键盘出现
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    self.modalTransitionStyle = self.wStyle;
    
    if (self.wType != DialogTypeShare&&self.wType!=DialogTypePickSelect&&self.wType != DialogTypeSheet&&self.wType!=DialogTypePop&&self.wType!=DialogTypeMenusSelect&&self.wType!=DialogTypeAdvertisement&&self.wType!=DialogTypeBuyCar) {
        self.mainView.layer.cornerRadius = self.wMainRadius;
        self.mainView.layer.masksToBounds = YES;
    }
    
    self.titleLabel.text = _wTitle;
    self.titleLabel.font = [UIFont systemFontOfSize:_wTitleFont];
    self.titleLabel.textColor =  _wTitleColor;

    self.textLabel.text = _wMessage;
    self.textLabel.font = [UIFont systemFontOfSize:_wMessageFont];
    self.textLabel.textColor =  _wMessageColor;
    
    [self.cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelBtn setTitle:_wCancelTitle forState:UIControlStateNormal];
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:_wCancelFont];
    [self.cancelBtn setTitleColor:_wCancelColor forState:UIControlStateNormal];
    self.cancelBtn.backgroundColor = _wMainBackColor;
    
    [self.OKBtn setTitle:_wOKTitle forState:UIControlStateNormal];
    [self.OKBtn setTitleColor:_wOKColor forState:UIControlStateNormal];
    self.OKBtn.titleLabel.font = [UIFont systemFontOfSize:_wOKFont];
    self.OKBtn.backgroundColor = _wMainBackColor;
    [self.OKBtn addTarget:self action:@selector(OKAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.wCloseBtn addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    [self.wCloseBtn setTitle:@"X" forState:UIControlStateNormal];
    [self.wCloseBtn setTitleColor:self.wCancelColor forState:UIControlStateNormal];
    self.wCloseBtn.backgroundColor = self.wMainBackColor;
    self.wCloseBtn.layer.borderWidth = DialogK1px;
    self.wCloseBtn.layer.borderColor = self.wCancelColor.CGColor;
    
    self.mainView.frame = CGRectMake(0, 0, self.wWidth, Dialog_GetHNum(267));
    self.mainView.backgroundColor = _wMainBackColor;
    
    self.shadowView.backgroundColor = _wShadowColor;
    self.shadowView.alpha = _wShadowAlpha;
    
    if (_wShadowCanTap) {
        self.shadowView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
        [self.shadowView addGestureRecognizer:tap];
    }
    
    
}

/*
 *开始
 */
- (void)start:(id)alert{
    if ([alert isKindOfClass:[UIView class]]) {
        if (self.wShadowShow) {
           [self.view addSubview:self.shadowView];
           [self.view sendSubviewToBack:self.shadowView];
        }
        [self.wParentVC presentViewController:self animated:YES completion:nil];
    }else if ([alert isKindOfClass:[UIAlertController class]]){
        [self.wParentVC presentViewController:alert animated:YES completion:nil];
    }
}

/*
 *关闭
 */
- (void)closeView{
    self.close = YES;
    if (self.wType == DialogTypePay || self.wType == DialogTypeWrite) {
        [self.mainView endEditing:YES];
    }
    [self dismissViewControllerAnimated:YES completion:nil];

    if (self.wEventClose) {
        self.wEventClose(@"关闭", self.wType);
    }
}

/*
 *重新设置mainView的frame
 */
- (void)reSetMainViewFrame:(CGRect)frame{
    CGPoint center = CGPointZero;
    
    if (self.wMainToBottom) {
        frame.origin.y = Device_Dialog_Height-frame.size.height;
        self.mainView.frame =frame;
        center = CGPointMake(self.view.center.x, self.mainView.center.y);
        
    }else{
        center = self.view.center;
        self.mainView.frame =frame;
    }

    if (self.wType != DialogTypeMenusSelect) {
        self.mainView.center = center;
    }


}

/*
 *添加底部
 */
- (UIView*)addBottomView:(CGFloat)maxY{
    if (self.bottomView) {
        self.bottomView.frame = CGRectMake(0, maxY, self.wWidth, CGRectGetMaxY(self.OKBtn.frame));
        return self.bottomView;
    }
    
    self.bottomView = [UIView new];
    [self.mainView addSubview:self.bottomView];
    
    UIView *upLine = [UIView new];
    upLine.alpha = self.wLineAlpha;
    [self.bottomView addSubview:upLine];
    upLine.backgroundColor = self.wLineColor;
    upLine.frame = CGRectMake(0, 0, self.wWidth, DialogK1px);
    
    
    if (self.wEventCancelFinish) {
        [self.bottomView addSubview:self.cancelBtn];
        self.cancelBtn.frame = CGRectMake(0, CGRectGetMaxY(upLine.frame)+self.wMainOffsetX, self.wWidth/2-DialogK1px/2, self.wMainBtnHeight);
        
        UIView *Line = [UIView new];
        Line.alpha = self.wLineAlpha;
        [self.bottomView addSubview:Line];
        Line.backgroundColor = self.wLineColor;
        Line.frame = CGRectMake(CGRectGetMaxX(self.cancelBtn.frame), self.cancelBtn.frame.origin.y, DialogK1px, self.wMainBtnHeight);

    }
    
    [self.bottomView addSubview:self.OKBtn];
    self.OKBtn.frame = CGRectMake(self.wEventCancelFinish?CGRectGetMaxX(self.cancelBtn.frame)+DialogK1px:0, CGRectGetMaxY(upLine.frame)+self.wMainOffsetX,self.wEventCancelFinish?self.wWidth/2-DialogK1px/2:self.wWidth, self.wMainBtnHeight);
    
    self.bottomView.frame = CGRectMake(0, maxY, self.wWidth, CGRectGetMaxY(self.OKBtn.frame));
    return self.bottomView;
}

# pragma  mark tableView 代理
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return   self.wType ==  DialogTypeMenusSelect?[[self getMyDataArr:tableView.tag withType:0] count]:[self.wData count];
    
}

# pragma  mark tableView 代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id data = (self.wType ==  DialogTypeMenusSelect?[self getMyDataArr:tableView.tag withType:0]:self.wData)[indexPath.row];
    
    if (self.wMyCell) {
        return self.wMyCell(indexPath,self.tableView,data);
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiaLogCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"DiaLogCell"];
        }

        cell.textLabel.font = [UIFont systemFontOfSize:self.wMessageFont];
        if ([data isKindOfClass:[WMZTree class]]) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            WMZTree *selectDic = (WMZTree*)data;
            cell.textLabel.text = selectDic.name;
            if (self.wTableViewColor.count>self.depth-1) {
                 cell.backgroundColor = self.wTableViewColor[selectDic.depth-1];
            }
            if (selectDic.isSelected) {
                cell.textLabel.textColor = self.wOKColor;
            }else{
                cell.textLabel.textColor = self.wTitleColor;
            }
        }else if([data isKindOfClass:[NSDictionary class]]){
            if (data[@"image"]) {
                cell.imageView.image = [UIImage imageNamed:data[@"image"]];
            }
            cell.textLabel.text = data[@"name"]?:@"";
        }else{
            cell.textLabel.text = data;
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  self.wType == DialogTypeBuyCar?UITableViewAutomaticDimension:self.wMainBtnHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.wType == DialogTypeMenusSelect) {
        [self selectWithTableView:tableView withIndexPath:indexPath];
    }else if (self.wType == DialogTypeBuyCar) {
        return;
    }else{
        [self closeView];
        if (self.wEventFinish) {
            self.wEventFinish(self.wData[indexPath.row], indexPath,self.wType);
        }
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

# pragma  mark pickView 代理
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return [self.wData count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.wData[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.wData[component][row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        pickerLabel.textColor = self.wMessageColor;
        pickerLabel.font = [UIFont systemFontOfSize:self.wMessageFont];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return self.wMainBtnHeight;
}

/*
 *键盘将要出现
 */
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyBoardHeight = endFrame.size.height;
    CGRect frame = self.mainView.frame;
    frame.origin.y = Device_Dialog_Height-(endFrame.size.height+self.mainView.frame.size.height+DialogK1px+self.wKeyBoardMarginY);
    self.mainView.frame = frame;
}

/*
 *键盘将要消失
 */
- (void)keyboardWillHide:(NSNotification *)notification{
    self.keyBoardHeight = 0;
    self.mainView.center = self.view.center;
}


/*
 *取消
 */
- (void)cancelAction:(UIButton*)btn{
    [self closeView];
    if (self.wEventCancelFinish) {
        self.wEventCancelFinish(@"取消",self.wType);
    }
}

/*
 *确定
 */
- (void)OKAction:(UIButton*)btn{
    [self closeView];
    if (self.wEventOKFinish) {
        self.wEventOKFinish(@"确定",self.wType);
    }

}

- (NSMutableDictionary *)configDic{
    if (!_configDic) {
        NSDictionary *dic = @{
                               @(DialogTypeNornal):@"normalAction",
                               @(DialogTypeSheet):@"sheetAction",
                               @(DialogTypeAuto):@"autoDisappealAction",
                               @(DialogTypeSystemPush):@"systemAction",
                               @(DialogTypeSystemSheet):@"systemSheetAction",
                               @(DialogTypePay):@"payAction",
                               @(DialogTypeShare):@"shareAction",
                               @(DialogTypeWrite):@"writeAction",
                               @(DialogTypeTime):@"timeAction",
                               @(DialogTypeSelect):@"selectAction",
                               @(DialogTypeDown):@"downAction",
                               @(DialogTypePop):@"popViewAction",
                               @(DialogTypePickSelect):@"pickAction",
                               @(DialogTypeMenusSelect):@"menusSelectAction",
                               @(DialogTypeAdvertisement):@"advertisementAction",
                               @(DialogTypeBuyCar):@"bugCarAction",
                              };
        _configDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    }
    return _configDic;
}

- (void)dealloc{

}

@end
