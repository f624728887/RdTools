//
//  GCDViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/1/24.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "GCDViewController.h"
#import "RdTools/RdToolsHeader.h"

@interface GCDViewController ()

@property (nonatomic, assign) NSInteger ticketSurplusCount;

@property (nonatomic, strong) RdGCDSemaphoreManager *tickSemaphore;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self dataInit];
    [self makeView];
    
    SEL aSel = @selector(makeView);
//    NSLog(@"%p", aSel);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    NSLog(@"123456");
}

- (void)dataInit{
    self.title = @"GCD";
    self.view.backgroundColor = Rd_ColorWith(whiteColor);
}

- (void)makeView{
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    dispatch_queue_set_specific(mainQueue, "key", "main", NULL);
//    dispatch_queue_t serialQueue = dispatch_queue_create("serial.queue", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//
//    dispatch_async(globalQueue, ^{
//        BOOL res1 = [NSThread isMainThread];
//        BOOL res2 = dispatch_get_specific("key") != NULL;
//
//        NSLog(@"is main thread: %zd --- is main queue: %zd", res1, res2);
//    });
//
//    dispatch_async(globalQueue, ^{
//        NSThread *globalThread = [NSThread currentThread];
//        NSLog(@"is main thread: %zd", [NSThread isMainThread]);
//        dispatch_sync(serialQueue, ^{
//            BOOL res = [NSThread currentThread] == globalThread;
//            NSLog(@"is same thread: %zd", res);
//        });
//        dispatch_async(dispatch_get_main_queue(), ^{
//            BOOL res = [NSThread currentThread] == globalThread;
//            NSLog(@"is same thread: %zd", res);
//            NSLog(@"is main thread: %zd --- is main queue: %zd", [NSThread isMainThread], dispatch_get_specific("key") != NULL);
//        });
//    });
//    [self group];
    
//    [self semaphore];
    
//    [self semaphore2];
    
    [self asyncSemaphoreTest];
}

- (void)group{
    NSLog(@"开始group任务");
    RdGCDGroupManager *group = [RdGCDGroupManager rd_GroupManager];
    [group rd_addGroupAction:^{
        for (int i = 0 ; i < 3; i ++) {
            [NSThread sleepForTimeInterval:2];
        }
        NSLog(@"事件1执行完毕");
    }];
    
    [group rd_addGroupAction:^{
        for (int i = 0 ; i < 2; i ++) {
            [NSThread sleepForTimeInterval:1];
        }
        NSLog(@"事件2执行完毕");
    }];
    
    [group rd_addGroupAction:^{
        for (int i = 0 ; i < 3; i ++) {
            [NSThread sleepForTimeInterval:3];
        }
        NSLog(@"事件3执行完毕");
    }];
    
    [group rd_addCompleteAction:^{
        NSLog(@"等待结束");
    }];
    [group rd_addGroupAction:^{
        for (int i = 0 ; i < 3; i ++) {
            [NSThread sleepForTimeInterval:3];
        }
        NSLog(@"事件4执行完毕");
    }];
}

- (void)semaphore{
    self.ticketSurplusCount = 50;
    
    RdGCDSemaphoreManager *tickSemaphore = [RdGCDSemaphoreManager rd_SemaphoreManagerValue:1];
    
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [tickSemaphore rd_action:^{
//            NSLog(@"%@", [weakSelf saleTicketSafe2]);
            [weakSelf saleTicketSafe];
            
        }];
    });
    
    dispatch_async(queue2, ^{
        [tickSemaphore rd_action:^{
//            NSLog(@"%@", [weakSelf saleTicketSafe2]);
            [weakSelf saleTicketSafe];
            
        }];
    });
}

- (void)semaphore2{
    self.ticketSurplusCount = 50;
    
    self.tickSemaphore = [RdGCDSemaphoreManager rd_SemaphoreManagerValue:1];
    
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf setTicket:20];
    });
    
    dispatch_async(queue2, ^{
        NSLog(@"%ld", (long)[weakSelf getTicket]);
    });
}

- (void)saleTicketSafe{
    while (1) {
        if (self.ticketSurplusCount > 0) {  //如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", (long)self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else { //如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            break;
        }
    }
}

- (NSString *)saleTicketSafe2{
    while (self.ticketSurplusCount > 0) {//如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", (long)self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        
    }
    //如果已卖完，关闭售票窗口
    return @"所有火车票均已售完";
}

- (void)setTicket:(NSInteger)count{
    [NSThread sleepForTimeInterval:0.5];
    [self.tickSemaphore rd_action:^{
        NSLog(@"start set");
        [NSThread sleepForTimeInterval:2];
        self.ticketSurplusCount = count;
        NSLog(@"end set");
    }];
}

- (NSInteger)getTicket{
    NSInteger __block count = 0;
    Rd_WeakSelf(self);
    [self.tickSemaphore rd_action:^{
        Rd_StrongSelf(self);
        NSLog(@"start get");
        [NSThread sleepForTimeInterval:3];
        NSLog(@"end get");
        count = self.ticketSurplusCount;
    }];
    return count;
}

- (void)asyncSemaphoreTest{
    RdAsyncSemaphoreManager *manager = [RdAsyncSemaphoreManager getAsyncSemaphoreManager];
    
    [manager rd_addAction:^(void (^ _Nonnull complete)(void)) {
        // 任务一
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"任务一开始");
            [NSThread sleepForTimeInterval:2];
            NSLog(@"任务一结束");
            complete();
        });
    }];
    
    [manager rd_addAction:^(void (^ _Nonnull complete)(void)) {
        // 任务二开始
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"任务二开始");
            [NSThread sleepForTimeInterval:6];
            NSLog(@"任务二结束");
            complete();
        });
    }];
    
    [manager rd_addAction:^(void (^ _Nonnull complete)(void)) {
        // 任务三开始
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"任务三开始");
            [NSThread sleepForTimeInterval:4];
            NSLog(@"任务三结束");
            complete();
        });
    }];
    
    NSLog(@"任务全部开始");
    [manager rd_complete:^{
        //全部结束
        NSLog(@"任务全部结束");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
 
 信号量：semaphore = 0
 任务池：actionArray

 每添加一次任务，信号量加一；
 开始执行所有任务，每个异步任务执行完回调后，调用一个代码块执行信号量减一的操作，
 当信号量为0时，则证明所有任务执行完毕。
 
 
*/

@end
