//
//  ViewController.m
//  ReactiveObjCDemo
//
//  Created by wupeng on 2017/5/23.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "ViewController.h"

#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/RACReturnSignal.h>

#define kScreenW [[UIScreen mainScreen] bounds].size.width

#define kScreenH [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) RACDisposable *textDisposable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *btnTitle = @[@"RACSiganl",@"RACSubject",@"RACReplaySubject",@"RACTupleAndRACSequence",@"RACCommand",
                          @"RACMulticastConnection",@"RACScheduler",@"flatternMap",@"concat",@"then",@"zipWith",
                          @"reduce",@"take",@"doNext",@"q_signal",@"q_subject",@"replay_siganl",@"replay_subject",
                          @"replayLast",@"replayLazily",@"retry",@"map",@"filter",@"ignore",@"distinctUntilChanged"
                          ,@"throttle",@"merge",@"timeout",@"inteval",@"delay",@"disposable",@"RACTuple",@"Array"
                          ,@"Dictoionary",@"liftSelector",@"bind",@"skip"];
    
        for (int i = 0; i < btnTitle.count; i++) {
            UIButton *btn = [[UIButton alloc] init];
            [btn setTitle:btnTitle[i] forState:UIControlStateNormal];
            CGFloat width = 120;
            CGFloat height = 40;
            CGFloat x = 5 + (width + 5) * (i%3);
            CGFloat y = 74 + (height +5) * (i/3);
            btn.frame = CGRectMake(x, y, width, height);
            btn.tag = i;
            btn.layer.borderColor = [UIColor redColor].CGColor;
            btn.layer.borderWidth = 1.0;
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
        }
    
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, kScreenH - 64 - 40 - 10, kScreenW - 40, 40)];
        textField.placeholder = @"测试rac信号输入...";
        textField.layer.borderColor = [UIColor redColor].CGColor;
        textField.layer.borderWidth = 1.0;
        [self.view addSubview:textField];
        self.textField = textField;
}

- (void)onClickButton:(id)button{
    UIButton *btn = (UIButton *)button;
    switch (btn.tag) {
        case 0:
        {
            [self RACSignal];
        }
            break;
        case 1:
        {
            [self RACSubject];
        }
            break;
        case 2:
        {
            [self RACReplaySubject];
        }
            break;
            
        case 3:
        {
            [self RACTupleAndRACSequence];
        }
            break;
        case 4:
        {
            [self RACCommand];
        }
            break;
        case 5:
        {
            [self RACMulticastConnection];
        }
            break;
        case 6:
        {
            [self RACScheduler];
        }
            break;
        case 7:
        {
            [self flatternMap];
        }
            break;
        case 8:
        {
            [self concat];
        }
            break;
        case 9:
        {
            [self then];
        }
            break;
        case 10:
        {
            [self zipWith];
        }
            break;
        case 11:
        {
            [self reduce];
        }
            break;
        case 12:
        {
            [self take];
        }
            break;
        case 13:
        {
            [self doNext];
        }
            break;
        case 14:
        {
            [self q_signal];
        }
            break;
        case 15:
        {
            [self q_subject];
        }
            break;
        case 16:
        {
            [self replay_siganl];
        }
            break;
        case 17:
        {
            [self replay_subject];
        }
            break;
        case 18:
        {
            [self replayLast];
        }
            break;
        case 19:
        {
            [self replayLazily];
        }
            break;
        case 20:
        {
            [self retry];
        }
            break;
        case 21:
        {
            [self map];
        }
            break;
        case 22:
        {
            [self filter];
        }
            break;
        case 23:
        {
            [self ignore];
        }
            break;
        case 24:
        {
            [self distinctUntilChanged];
        }
            break;
        case 25:
        {
            [self throttle];
        }
            break;
        case 26:
        {
            [self merge];
        }
            break;
        case 27:
        {
            [self timeout];
        }
            break;
        case 28:
        {
            [self interval];
        }
            break;
        case 29:
        {
            [self delay];
        }
        case 30:
        {
            [self dispose];
        }
            break;
        case 31:
        {
            [self RACTuple];
        }
            break;
        case 32:
        {
            [self NSArray];
        }
            break;
        case 33:
        {
            [self NSDictionary];
        }
            break;
        case 34:
        {
            [self liftSelector];
        }
            break;
        case 35:
        {
            [self bind];
        }
            break;
        case 36:
        {
            [self skip];
        }
            break;
        case 37:
        {
            //[self take];
        }
            break;
        default:
            break;
    }
    
}


- (void)RACSignal{
    // 1.创建信号
    RACSignal *siganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        // block调用时刻：每当有订阅者订阅信号，就会调用block。
        
        // 2.发送信号
        [subscriber sendNext:@1];
        
        // 如果不在发送数据，最好发送信号完成，内部会自动调用[RACDisposable disposable]取消订阅信号。
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
            // block调用时刻：当信号发送完成或者发送错误，就会自动执行这个block,取消订阅信号。
            // 执行完Block后，当前信号就不在被订阅了。
            NSLog(@"信号被销毁");
        }];
    }];
    
    // 3.订阅信号,才会激活信号.
    [siganl subscribeNext:^(id x) {
        // block调用时刻：每当有信号发出数据，就会调用block.
        NSLog(@"接收到数据:%@",x);
    }];
    
}

// RACSubject:信号提供者，自己可以充当信号，又能发送信号
- (void)RACSubject{
    // 1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    // 2.订阅信号
    [subject subscribeNext:^(id x) {
        // block调用时刻：当信号发出新值，就会调用.
        NSLog(@"第一个订阅者%@",x);
    }];
    
    [subject subscribeNext:^(id x) {
        // block调用时刻：当信号发出新值，就会调用.
        NSLog(@"第二个订阅者%@",x);
    }];
    
    // 3.发送信号
    [subject sendNext:@"101"];
    
}

// RACReplaySubject可以先发送信号
- (void)RACReplaySubject
{
    // 1.创建信号
    RACReplaySubject *replaySubject = [RACReplaySubject subject];
    
    // 2.发送信号
    [replaySubject sendNext:@1];
    [replaySubject sendNext:@2];
    
    // 3.订阅信号
    [replaySubject subscribeNext:^(id x) {
        
        NSLog(@"第一个订阅者接收到的数据%@",x);
    }];
    
    // 订阅信号
    [replaySubject subscribeNext:^(id x) {
        
        NSLog(@"第二个订阅者接收到的数据%@",x);
    }];
    [replaySubject sendNext:@3];
}

- (void)RACTupleAndRACSequence{
    // 1.遍历数组
    NSArray *numbers = @[@1,@2,@3,@4];
    
    // 这里其实是三步
    // 第一步: 把数组转换成集合RACSequence numbers.rac_sequence
    // 第二步: 把集合RACSequence转换RACSignal信号类,numbers.rac_sequence.signal
    // 第三步: 订阅信号，激活信号，会自动把集合中的所有值，遍历出来。
    [numbers.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"x=>%@",x);
    }];
    
    // 2.遍历字典,遍历出来的键值对会包装成RACTuple(元组对象)
    NSDictionary *dict = @{@"name":@"xmg",@"age":@18};
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
        RACTupleUnpack(NSString *key,NSString *value) = x;
        // 相当于以下写法
        // NSString *key = x[0];
        // NSString *value = x[1];
        NSLog(@"%@=%@",key,value);
    }];
    
}

- (void)RACCommand {
    // 1.创建命令
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"执行命令 参数-->%@",input);
        
        // 创建空信号,必须返回信号
        // return [RACSignal empty];
        
        // 2.创建信号,用来传递数据
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"请求callback数据"];
            
            // 注意：数据传递完，最好调用sendCompleted，这时命令才执行完毕。
            [subscriber sendCompleted];
            
            return nil;
        }];
        
    }];
    
    // 强引用命令，不要被销毁，否则接收不到数据
    //_command = command;
    
    // 3.订阅RACCommand中的信号
    [command.executionSignals subscribeNext:^(id x) {
        [x subscribeNext:^(id x) {
            NSLog(@"subscribeNext->%@",x);
        }];
    }];
    
    // RAC高级用法
    // switchToLatest:用于signal of signals，获取signal of signals发出的最新信号,也就是可以直接拿到RACCommand中的信号
    [command.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"switchToLatest->%@",x);
    }];
    
    // 4.监听命令是否执行完毕,默认会来一次(会先检测到之前的状态是执行完成)，可以直接跳过，skip表示跳过第一次信号
    // [command.executing subscribeNext:^(id x) {
    [[command.executing skip:1] subscribeNext:^(id x) {
        if ([x boolValue] == YES) {
            // 正在执行
            NSLog(@"正在执行");
        } else {
            // 执行完成
            NSLog(@"执行完成");
        }
    }];
    
    // 5.执行命令
    [command execute:@1];
}

// 用于当一个信号，被多次订阅时，为了保证创建信号时，避免多次调用创建信号中的block，
// 造成副作用，可以使用这个类处理。使用注意:RACMulticastConnection通过RACSignal的
// -publish或者-muticast:方法创建.

- (void)RACMulticastConnection {
    
    NSLog(@"======问题：订阅两次，发送两次请求数据====");
    
    // 1.创建请求信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"发送请求---1");
        [subscriber sendNext:@1];
        return nil;
    }];
    
    // 2.订阅信号
    [signal subscribeNext:^(id x) {
        NSLog(@"接收数据---1");
    }];
    
    // 2.订阅信号
    [signal subscribeNext:^(id x) {
        NSLog(@"接收数据---1");
    }];
    
    // 3.运行结果，会执行两遍发送请求，也就是每次订阅都会发送一次请求
    NSLog(@"=====解决：订阅了2次，但仅仅发了一次请求，且两个订阅者都会收到信号====");
    
    // RACMulticastConnection:解决重复请求问题
    // 1.创建信号
    RACSignal *newSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"发送请求--2");
        [subscriber sendNext:@1];
        return nil;
    }];
    
    // 2.创建连接
    RACMulticastConnection *connect = [newSignal publish];
    
    // 3.订阅信号，
    // 注意：订阅信号，也不能激活信号，只是保存订阅者到数组，必须通过连接,当调用连接，就会一次性调用所有订阅者的sendNext:
    [connect.signal subscribeNext:^(id x) {
        NSLog(@"订阅者一信号--%@",x);
    }];
    
    [connect.signal subscribeNext:^(id x) {
        NSLog(@"订阅者二信号-%@",x);
    }];
    
    // 4.连接,激活信号
    [connect connect];
    
}

- (void)RACScheduler{
    //deliverOn
    NSLog(@"====deliverOn====");
    //创建信号
    RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"sendTestSignal%@",[NSThread currentThread]);
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    
    //订阅信号
    //要想放在主线程执行只要将[RACScheduler scheduler]更换为[RACScheduler mainThreadScheduler]
    [[signal deliverOn:[RACScheduler scheduler]] subscribeNext:^(id x) {
        NSLog(@"receiveSignal%@",[NSThread currentThread]);
    }];
    
    //subscribeOn
    //    NSLog(@"=====subscribeOn=======")
    //    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //
    //        NSLog(@"sendSignal%@",[NSThread currentThread]);
    //        [subscriber sendNext:@1];
    //        return [RACDisposable disposableWithBlock:^{
    //        }];
    //    }] subscribeOn:[RACScheduler scheduler]] subscribeNext:^(id x) {
    //
    //        NSLog(@"receiveSignal%@",[NSThread currentThread]);
    //    }];
    //
    //    //timeout
    //    NSLog(@"======timeout=======")
    //    RACSignal *timeoutSignal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        return nil;
    //    }] timeout:3 onScheduler:[RACScheduler currentScheduler]];
    //
    //    [timeoutSignal subscribeNext:^(id x) {
    //
    //        NSLog(@"%@",x);
    //    } error:^(NSError *error) {
    //        // 3秒后会自动调用
    //        NSLog(@"%@",error);
    //    }];
    
    //interval
    //    NSLog(@"=======interval=======")
    //    [[RACSignal interval:1 onScheduler:[RACScheduler currentScheduler]] subscribeNext:^(id x) {
    //
    //        NSLog(@"%@",x);
    //    }];
    
}

// flattenMap 根据前一个信号的参数创建一个新的信号！map 是在源信号返回值上返回的一个新值
// flattenMap作用:把源信号的内容映射成一个新的信号，信号可以是任意类型。
// map 和 flattenMap 的作用都是对一个信号进行改造（这两个方法的返回值都是一个信号）。
// 两者的不同点在于，map 改变了传递的值，flattenMap 改变的是信号本身。 使用 map 的时候，block 中应该 return 你后面希望接收到的值 使用 flattenMap 的时候，block 中应该 return 你想要的信号
- (void)flatternMap {
    // 创建信号中的信号
    RACSubject *subSignal = [RACSubject subject];
    
    RACSignal *bindSignal = [subSignal flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        NSLog(@"1---->%@",value);
       NSString *str = [NSString stringWithFormat:@"111111++++%@",value];
        return [RACReturnSignal return:str];
    }];
    
    [bindSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"加工后的 %@",x);
    }];

    [subSignal subscribeNext:^(id  _Nullable x) {
            NSLog(@"未加工的 %@",x);
    }];
    
    // 信号发送内容
    [subSignal sendNext:@1];
}

// 按一定顺序拼接信号，当多个信号发出的时候，有顺序的接收信号，依赖关系把一组信号串联起来，第一个信号complete，后面一个信号才开始发挥作用
// 注意：第一个信号必须发送完成，第二个信号才会被激活
- (void)concat{
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"1111111");
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"2222222");
        [subscriber sendNext:@2];
        return nil;
    }];
    
    // 把signalA拼接到signalB后，signalA发送完成，signalB才会被激活。
    RACSignal *concatSignal = [signalA concat:signalB];
    
    // 以后只需要面对拼接信号开发。
    // 订阅拼接的信号，不需要单独订阅signalA，signalB
    // 内部会自动订阅。
    // 注意：第一个信号必须发送完成，第二个信号才会被激活
    [concatSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}

//then:用于连接两个信号，当第一个信号完成，才会连接then返回的信号。
// 注意使用then之前信号的值会被忽略掉.
// 底层实现：1、先过滤掉之前的信号发出的值。2.使用concat连接then返回的信号
- (void)then {
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return nil;
    }] then:^RACSignal *{
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@2];
            return nil;
        }];
    }] subscribeNext:^(id x) {
        // 只能接收到第二个信号的值，也就是then返回信号的值
        NSLog(@"%@",x);
    }];
}

// zipWith:把两个信号压缩成一个信号，只有当两个信号同时发出信号内容时，并且把两个信号的内容合并成一个元组，才会触发压缩流的next事件。
- (void)zipWith{
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@2];
        return nil;
    }];
    
    // 压缩信号A，信号B
    RACSignal *zipSignal = [signalA zipWith:signalB];
    [zipSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);

        // <RACTwoTuple: 0x6000016a4040> (1,2)
    }];
}

- (void)reduce {
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        return nil;
    }];
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@2];
//        [subscriber sendError:[NSError new]];
        return nil;
    }];
    
    // 常见的用法，（先组合在聚合）。combineLatest:(id<NSFastEnumeration>)signals reduce:(id (^)())reduceBlock
    // reduce中的block简介:
    // reduceblcok中的参数，有多少信号组合，reduceblcok就有多少参数，每个参数就是之前信号发出的内容
    // reduceblcok的返回值：聚合信号之后的内容。
    
    RACSignal *reduceSignal = [RACSignal combineLatest:@[signalA,signalB] reduce:^id(NSNumber *num1 ,NSNumber *num2){
        return [NSString stringWithFormat:@"%@ %@",num1,num2];
    }];
    [reduceSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)take{
    NSLog(@"======take======");
    // 1、创建信号
    RACSubject *signal0 = [RACSubject subject];
    // 2、处理信号，订阅前3个信号
    [[signal0 take:3] subscribeNext:^(id x) {
        NSLog(@"==>%@",x);
    }];
    // 3.发送信号
    [signal0 sendNext:@1];
    [signal0 sendNext:@2];
    [signal0 sendNext:@3];
    [signal0 sendNext:@4];
    [signal0 sendNext:@5];
    
    NSLog(@"=======takeLast======");
    // 1、创建信号
    RACSubject *signal1 = [RACSubject subject];
    // 2、处理信号，订阅倒数5个信号
    [[signal1 takeLast:5] subscribeNext:^(id x) {
        NSLog(@"-->%@",x);
    }];
    // 3.发送信号
    [signal1 sendNext:@1];
    [signal1 sendNext:@2];
    [signal1 sendNext:@3];
    [signal1 sendNext:@4];
    [signal1 sendNext:@5];
    [signal1 sendNext:@6];
    [signal1 sendNext:@7];
    [signal1 sendNext:@8];
    [signal1 sendNext:@9];
    [signal1 sendCompleted];//必须调完成
    
    RACSubject *subject = [RACSubject subject];
    RACSubject *signal = [RACSubject subject];
    // takeUntil: 只要 signal Trigger 信号发送了任意数据或者发送完成, 就不能在接收原信号发送的内容了.
    [[subject takeUntil:signal] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    
    [subject sendNext:@"数据A"];
    [signal  sendNext:@"数据B"]; // | [signal sendCompleted];
    [subject sendNext:@"数据C"];
    [subject sendNext:@"数据D"];
}

- (void)doNext{
    [[[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"sendNext");
        [subscriber sendNext:@123];
        [subscriber sendCompleted];
        return nil;
    }] doNext:^(id x) {
        // 执行[subscriber sendNext:@1];之前会调用这个Block
        NSLog(@"doNext-->%@",x);
    }] doCompleted:^{
        // 执行[subscriber sendCompleted];之前会调用这个Block
        NSLog(@"doCompleted");
    }] subscribeNext:^(id x) {
        NSLog(@"subscribeNext-->%@",x);
    }];
}

- (void)q_signal{
    __block int num = 0;
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id  subscriber) {
        num++;
        NSLog(@"Increment num to: %i", num);
        [subscriber sendNext:@(num)];
        return nil;
    }];
    NSLog(@"Start subscriptions");
    // Subscriber 1 (S1)
    [signal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    // Subscriber 2 (S2)
    [signal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
    // Subscriber 3 (S3)
    [signal subscribeNext:^(id x) {
        NSLog(@"S3: %@", x);
    }];
}

- (void)q_subject{
    RACSubject *letters = [RACSubject subject];
    RACSignal *signal = letters;
    
    // Subscriber 1 (S1)
    NSLog(@"Subscribe S1");
    [signal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    NSLog(@"Send A");
    [letters sendNext:@"A"];
    NSLog(@"Send B");
    [letters sendNext:@"B"];
    
    // Subscriber 2 (S2)
    NSLog(@"Subscribe S2");
    [signal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
    NSLog(@"Send C");
    [letters sendNext:@"C"];
    NSLog(@"Send D");
    [letters sendNext:@"D"];
    
    // Subscriber 3 (S3)
    NSLog(@"Subscribe S3");
    [signal subscribeNext:^(id x) {
        NSLog(@"S3: %@", x);
    }];
    
}

// 这个replay方法将返回一个新的信号，当源信号被订阅时，会立即发送给订阅者全部历史的值，
// 不会重复执行源信号中的订阅代码，不仅如此，订阅者还将收到所有未来发送的值。
- (void)replay_siganl{
    __block int num = 0;
    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id  subscriber) {
        num++;
        NSLog(@"Increment num to: %i", num);
        [subscriber sendNext:@(num)];
        return nil;
    }] replay];//调用replay
    
    NSLog(@"Start subscriptions");
    
    // Subscriber 1 (S1)
    [signal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    
    // Subscriber 2 (S2)
    [signal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
    
    // Subscriber 3 (S3)
    [signal subscribeNext:^(id x) {
        NSLog(@"S3: %@", x);
    }];
}

- (void)replay_subject{
    RACSubject *letters = [RACSubject subject];
    RACSignal *signal = [letters replay];
    
    NSLog(@"Subscribe S1");
    [signal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    
    NSLog(@"Send A");
    [letters sendNext:@"A"];
    NSLog(@"Send B");
    [letters sendNext:@"B"];
    
    NSLog(@"Subscribe S2");
    [signal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
    
    NSLog(@"Send C");
    [letters sendNext:@"C"];
    NSLog(@"Send D");
    [letters sendNext:@"D"];
    
    NSLog(@"Subscribe S3");
    [signal subscribeNext:^(id x) {
        NSLog(@"S3: %@", x);
    }];
}

// replayLast返回一个新的信号，当源信号被订阅时，会立即发送给订阅者最新的值，
// 不会重复执行源信号中的订阅代码。订阅者还会收到信号未来所有的值。
- (void)replayLast{
    RACSubject *letters = [RACSubject subject];
    RACSignal *signal = [letters replayLast];
    
    NSLog(@"Subscribe S1");
    [signal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    
    NSLog(@"Send A");
    [letters sendNext:@"A"];
    NSLog(@"Send B");
    [letters sendNext:@"B"];
    
    NSLog(@"Subscribe S2");
    [signal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
    
    NSLog(@"Send C");
    [letters sendNext:@"C"];
    NSLog(@"Send D");
    [letters sendNext:@"D"];
    
    NSLog(@"Subscribe S3");
    [signal subscribeNext:^(id x) {
        NSLog(@"S3: %@", x);
    }];
}

// 这replayLazily方法返回一个新的信号，当源信号被订阅时，会立即发送给订阅者全部历史的值，不会重复执行源信号中的订阅代码
- (void)replayLazily{
    __block int num = 0;
    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id  subscriber) {
        num++;
        NSLog(@"Increment num to: %i", num);
        [subscriber sendNext:@(num)];
        return nil;
    }] replayLazily];  //跟replay不同的就这么一个地方
    
    NSLog(@"Start subscriptions");
    
    // Subscriber 1 (S1)
    [signal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    
    // Subscriber 2 (S2)
    [signal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
    
    // Subscriber 3 (S3)
    [signal subscribeNext:^(id x) {
        NSLog(@"S3: %@", x);
    }];
    
}

// 重试一直到返回正常值
- (void)retry{
    __block int i = 0;
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if (i == 10) {
            [subscriber sendNext:@1];
        }else{
            NSLog(@"接收到错误");
            [subscriber sendError:nil];
        }
        i++;
        return nil;
    }] retry] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    } error:^(NSError *error) {
    }];
    
}

// 把多个信号合并为一个信号，任何一个信号有新值的时候就会调用
- (void)merge{
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        return nil;
    }];
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@2];
        return nil;
    }];
    // 合并信号,任何一个信号发送数据，都能监听到.
    RACSignal *mergeSignal = [signalA merge:signalB];
    [mergeSignal subscribeNext:^(id x) {
        NSLog(@"1--->%@",x);
    }];
    [mergeSignal subscribeNext:^(id x) {
        NSLog(@"2--->%@",x);
    }];
    [mergeSignal subscribeNext:^(id x) {
        NSLog(@"3--->%@",x);
        
    }];
    
    // 输出
    // 2021-10-28 10:53:48.465689+0800 ReactiveObjCDemo[55593:1019290] 1--->1
    // 2021-10-28 10:53:48.465900+0800 ReactiveObjCDemo[55593:1019290] 1--->2
    // 2021-10-28 10:53:48.466103+0800 ReactiveObjCDemo[55593:1019290] 2--->1
    // 2021-10-28 10:53:48.466245+0800 ReactiveObjCDemo[55593:1019290] 2--->2
    // 2021-10-28 10:53:48.466423+0800 ReactiveObjCDemo[55593:1019290] 3--->1
    // 2021-10-28 10:53:48.466548+0800 ReactiveObjCDemo[55593:1019290] 3--->2
}

#pragma mark - textFieldSignal
// 调用这个block，修改源信号的内容
- (void)map {
    [self.textDisposable dispose];
    
    self.textDisposable = [[_textField.rac_textSignal map:^id(id value) {
        // 当源信号发出，就会调用这个block，修改源信号的内容
        // 返回值：就是处理完源信号的内容。
        return [NSString stringWithFormat:@"输出:%@",value];
    }] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
}

//此处做筛选的条件操作
- (void)filter{
    
    [self.textDisposable dispose];
    // 过滤:
    // 每次信号发出，会先执行过滤条件判断.
    self.textDisposable = [[_textField.rac_textSignal filter:^BOOL(NSString *value) {
        //此处做筛选的条件操作
        return [value length] > 3;
    }] subscribeNext:^(id x) {
        NSLog(@"x = %@", x);
    }];
    
}

- (void)ignore{
    [self.textDisposable dispose];
    
    // 内部调用filter过滤，忽略掉ignore的值
    [[_textField.rac_textSignal ignore:@"1"] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)distinctUntilChanged{
    [self.textDisposable dispose];
    // 过滤，当上一次和当前的值不一样，就会发出内容。
    // 在开发中，刷新UI经常使用，只有两次数据不一样才需要刷新
    self.textDisposable = [[_textField.rac_textSignal distinctUntilChanged] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}

- (void)throttle{
    [self.textDisposable dispose];
    
    self.textDisposable = [[[_textField rac_textSignal] throttle:1] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

// combineLatest：合并信号，并且拿到各个信号的最新的值,必须每个合并的signal至少都有过一次sendNext，才会触发合并的信号
// combineLatestWith：合并信号，当两个信号都有sendNext才会触发合并的信号


- (void)timeout {
    NSLog(@"timeout");
    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"hello, RAC."];
//        [subscriber sendCompleted];
        return nil;
    }] timeout:3.0 onScheduler:[RACScheduler currentScheduler]];
    
    [signal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)interval {
    [[RACSignal interval:3.0 onScheduler:[RACScheduler currentScheduler]] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)delay {
    NSLog(@"delay");
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"hello, RAC."];
        return nil;
    }] delay:2.0] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)dispose {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber ) {
        [subscriber sendNext:@"hello, RAC."];
        
        // 如果信号不再发送数据, 最好调用信号的发送完成方法, 该方法会调用 [RACDisposable disposable] 取消订阅信号
//        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            // 订阅者释放时会自动取消订阅信号, 但是只要订阅者没有释放, 就不会取消订阅信号
            NSLog(@"信号被取消订阅了!");
        }];
    }];
    
    self.textDisposable = [signal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 主动取消订阅信号
    [self.textDisposable dispose];
}

- (void)RACTuple {
    RACTuple *tuple = [RACTuple tupleWithObjectsFromArray:@[@"B", @"R", @"A", @"C", @"."]];
    NSLog(@"%@", tuple[0]);
    NSLog(@"%@", tuple[2]);
}

- (void)NSArray {
    NSArray *array = @[@"B", @"R", @"A", @"C", @"."];
    [array.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)NSDictionary {
    NSDictionary *dictionary = @{@"name": @"willing", @"age": @"26"};
    [dictionary.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        // 方式一:
//        NSString *key = x[0];
//        NSString *value = x[1];
//        NSLog(@"%@: %@", key, value);
        
        // 方式二:
        // RACTupleUnpack: 解析元组, 参数是解析出来的变量名, '=' 右边是被解析的元组
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"%@: %@", key, value);
    }];
}

- (void)liftSelector {
    // 需求: 多个请求全部完成后再刷新 UI
    RACSignal *hotSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"请求热销模块数据");
        [subscriber sendNext:@"热销模块数据"];
        return nil;
    }];
    RACSignal *newSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"请求最新模块数据");
        [subscriber sendNext:@"最新模块数据"];
        return nil;
    }];
    // withSignalsFromArray 中的所有信号都发送数据后才会执行 selector, selector 的参数就是每个信号发送的数据
    [self rac_liftSelector:@selector(updateUIWithHotData:newData:) withSignalsFromArray:@[hotSignal, newSignal]];
}

- (void)updateUIWithHotData:(NSString *)hotData newData:(NSString *)newData {
    // 刷新 UI
    NSLog(@"%@", hotData);
    NSLog(@"%@", newData);
}

- (void)bind {
    
    // 1.原信号
    RACSubject *subject = [RACSubject subject];
    
    // 2.绑定信号
    RACSignal *bindSignal = [subject bind:^RACSignalBindBlock _Nonnull{
        return ^RACSignal *(id value, BOOL *stop) {
            NSLog(@"原信号发送的内容: %@", value);
            value = [NSString stringWithFormat:@"解析后的%@",value];
            // 不能 return nil, 可以 return [RACSignal empty].
            return [RACReturnSignal return:value];
        };
    }];
    
    // 3.订阅绑定信号
    [bindSignal subscribeNext:^(id x) {
        NSLog(@"绑定信号发送的内容: %@", x);
    }];
    
    // 4.原信号发送数据
    [subject sendNext:@"JSON数据"];
}

- (void)skip {
    // skip: 跳过 skipCount 次信号.
    RACSubject *subject = [RACSubject subject];
    [[subject skip:2] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    [subject sendNext:@"数据A"];
    [subject sendNext:@"数据B"];
    [subject sendNext:@"数据C"];
    [subject sendNext:@"数据D"];
    
    // C,D 输出
}

@end

