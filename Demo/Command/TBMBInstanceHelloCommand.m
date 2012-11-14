//
// Created by <a href="mailto:wentong@taobao.com">文通</a> on 12-11-14 下午1:53.
//


#import "TBMBInstanceHelloCommand.h"
#import "TBMBTestService.h"
#import "TBMBDefaultNotification.h"
#import "TBMBMessageSender.h"
#import "TBMBGlobalFacade.h"


@implementation TBMBInstanceHelloCommand {

}

- (void)instanceHelloHandler:(id <TBMBNotification>)notification {
    NSLog(@"command Thread:[%@] isMain[%d]", [NSThread currentThread], [NSThread isMainThread]);
    [TBMBTestService helloWorld:notification.body result:^(NSString *ret) {
        NSLog(@"command Callback Thread:[%@] isMain[%d]", [NSThread currentThread], [NSThread isMainThread]);
        [[TBMBGlobalFacade instance] sendTBMBNotification:[notification createNextNotification:@"receiveInstanceHello"
                                                                                      withBody:ret]];
    }];
}


@end