//
//  GCDViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/1/24.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "GCDViewController.h"
#import "RdTools/RdToolsHeader.h"
#import "RdTools/RdGCDTools.h"

@interface GCDViewController ()

@property (nonatomic, assign) NSInteger ticketSurplusCount;

@property (nonatomic, strong) RdGCDSemaphore *tickSemaphore;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self dataInit];
    [self makeView];
}

- (void)dataInit{
    self.title = @"GCD";
    self.view.backgroundColor = Rd_ColorWith(whiteColor);
}

- (void)makeView{
    [self group];
    
//    [self semaphore];
    
//    [self semaphore2];
}

- (void)group{
    NSLog(@"开始group任务");
    RdGCDGroup *group = [RdGCDGroup rd_Group];
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
}

- (void)semaphore{
    self.ticketSurplusCount = 50;
    
    RdGCDSemaphore *tickSemaphore = [RdGCDSemaphore rd_SemaphoreValue:1];
    
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
    
    self.tickSemaphore = [RdGCDSemaphore rd_SemaphoreValue:1];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
