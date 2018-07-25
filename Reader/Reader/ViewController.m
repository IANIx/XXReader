//
//  ViewController.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "ViewController.h"
#import "BookReadViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setupSubviews {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"开始阅读" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showReadVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 100));
        make.center.equalTo(self.view);
    }];
}

- (void)showReadVC {
    BookReadViewController *bookReadVC = [[BookReadViewController alloc]init];
    bookReadVC.content = @"吃饭的时候，丝丝犹在懊恼没有早点来，否则说不定可以和肖奈邻桌而食。\n二喜打击她：“别做梦了，和肖师兄一起的人看上去都是社会人士，人家要谈事情的，肯定在包厢。”\n晓玲在一旁欲言又止了半天，说：“我听说，好像肖师兄的公司出了点问题。”\n“不会吧！”丝丝惊呼。\n微微和二喜也一副不相信的样子，对计算机系的师弟师妹来说，肖奈那是神级存在，怎么可能会有问题。\n“我听大钟说的啦，大钟有个篮球队的队友，毕业了在肖师兄公司上班，前天他和大钟吃饭，喝多了不小心漏了点口风，好像是投资方出什么问题了吧，就这几天的事情。”\n丝丝说：“我还是不太相信，肖奈哎！”\n微微正咬着鸡翅膀不能说话，闻言猛点头表示附和。肖奈哎！如果一个人很厉害很强大称之为牛，那么肖奈绝对是犀牛。犀牛，就是稀少的牛，罕见的牛……他也会有搞不定的事？\n不过想起刚刚灯光下肖奈的神色，人前还是淡淡的笑意，转眼就是漠然，微微又不太确定了。\n二喜若有所思地问：“投资方？那是资金的问题？”\n“不知道。”晓玲说着强调，“不保证可信度，不过就算是假的你们也别说出去哦。”\n“嗯嗯嗯。”微微咬着鸡翅含糊不清地点头，“保证不说，和今天的鸡翅一起消化掉。”\n天才的世界毕竟太遥远了，几个女生讨论了一阵，很快又聊起别的话题。吃完饭回到宿舍，微微第一时间上了《梦游江湖》，可是诡异的，好友栏里居然一个人都不在，微微百无聊赖，想起夫妻PK大赛的事情，又跑去游戏论坛。\n以前微微是很少逛论坛的，攻略也不怎么研究，因为她一直觉得玩游戏的乐趣就是探索，什么都知道了，就一点意思都没有了。不过后来和奈何结婚，出于对大神负责的心态，微微常常会去论坛逛逛，研究一下夫妻技能之类的东西，有阵子还研究了下生孩子，不过当看到生孩子需要洞房一小时，而且怀孕后女方技能会减弱，打斗多了还可能流产……\n微微立马打消了生孩子的念头。\n这个游戏真是太BT了！\n在论坛逛了一会，微微没看到PK大赛的新消息，倒是看到了真水无香发的帖子，很热地飘在首页，主题是“（视频）『参赛』我们的故事——雨落水心涟漪香”。\n“我们的故事”这个活动微微是知道的，是新近比较热门的活动之一。活动要求玩家用游戏录像的功能，录制一段《梦游江湖》里的爱情故事，长短不限，奖励丰厚，得奖者将由玩家投票选出。其实就是相当于用《梦游江湖》的录像功能录一段小电影的感觉，做起来并不难，所以不少玩家都参赛了。\n看来真水无香也参赛了？\n微微好奇地进帖，帖子里是一个视频加几段文字，微微点开视频看了几分钟，貌似是讲述一个英雄救美，然后英雄追求美女的故事，主角正是小雨妖妖和真水无香，小雨家族的人也有在里面出现。\n再看了几分钟，却渐渐觉得不对味起来，为什么里面竟然有个叫鲁猥猥猥的女配角？\n而且这个鲁猥猥猥也是红衣背刀的女侠，她不时地出现在真水和小雨的身边纠缠真水，频频做出痛哭花痴之类的丑态，语言更是粗鲁不文，还带着芙蓉姐姐式的自恋，跟小雨妖妖时不时来句诗词的文雅成为明显对比。\n视频的结尾，小雨妖妖真人出来说了几句话，大意是希望大家支持之类的，视频下面的文字是真水的，情真意切地讲述了自己对小雨妖妖的感情，希望大家投票支持他们，说虽然奖励无所谓，但是很希望得到那套全服唯一的七彩情侣套装，因为老婆很喜欢。\n微微越看越火大，这算什么！你要秀真情可以，为什么要拉别人出来搞笑料。关掉帖子上游戏，真水无香不在线，微微满腔怒火没处发，愤怒地敲了个消息过去。\n“这样影射丑化别人很有意思吗？没想到你是这种人！”\n消息发了过去，仍然觉得气愤，可是好孩子微微又想不出什么恶毒的话来骂人，只好加倍郁闷地关了游戏睡觉了。\n第二天微微一天的课，晚上九点才上线，一上线，好友栏就狂跳，点开，是真水无香的消息。\n“OK，技不如人，我愿赌服输，视频我会删掉，和小雨重拍一个。不过就算这样，我也要解释一下，那个鲁猥猥猥不是我和小雨搞的，开始根本没注意，以为有人捣乱，也没联想到你的名字，你应该看出这个角色说的话和剧情一点关系都没有。后来拍完才知道是小雨家族几个朋友恶作剧，不过视频都拍好了，重来太麻烦，就没重做。这点我给你道歉，现在我也掉级了，算偿还你，我们恩怨两清。”\n微微一愣，回过去：“什么愿赌服输，掉级又是怎么回事？”\n真水无香在线，却没有回复过来。\n微微看看好友栏，奈何大神的名字闪闪发光，微微囧囧地敲过去：“大神，你是不是杀了真水啊。”\n奈何：“苍翠山下，过来，Boss。”\n微微赶到苍翠山下，愚公爬山一看到她就喊：“嫂子，快来补一刀。”\n微微很汗地在Boss身上补了一下，本来就只剩下一层血皮的Boss轰然倒地，微微平白分到了一堆经验。\nBoss爆出来不少东西，大家分完，微微问奈何：“你是不是杀了真水无香啊？”\n奈何：“嗯。”\n呃，微微也不知道说什么好，貌似又麻烦到大神了呀。虽然是夫妻，可是微微更觉得自己和大神是合作关系，所以自己的事情应该自己解决才对。\n微微：“麻烦你了&amp;gt;o&amp;lt;”\n奈何：“不会，我想杀他很久了。”\n微微：“……为什么@@”\n大神和真水都没见过吧，怎么会有仇？\n奈何：“不顺眼。”\n微微：“。。。。。。”\n果然是典型的大神答案。\n愚公爬山插嘴：“嫂子，你知道视频的事？”\n微微：“嗯，昨天你们都没来，我无聊去逛论坛了。”\n莫扎他：“本来还想瞒着你。”\n微微：“&amp;gt;o&amp;lt;”\n微微：“对了，真水无香怎么会掉级？PK不会掉级啊。”\nPK属于切磋范畴，就算输了也不会掉级的。\n猴子酒：“不是PK，是决斗。”\n";
    bookReadVC.pageIndex = 0;
    [self presentViewController:bookReadVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
