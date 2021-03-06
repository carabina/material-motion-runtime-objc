/*
 Copyright 2016-present The Material Motion Authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MDMTransaction.h"
#import "MDMTransaction+Private.h"

@implementation MDMTransaction {
  NSMutableArray *_logs;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _logs = [NSMutableArray array];
  }
  return self;
}

- (void)addPlan:(NSObject<MDMPlan> *)plan toTarget:(id)target {
  MDMTransactionLog *log = [MDMTransactionLog new];
  log.plans = @[ [plan copy] ];
  log.target = target;
  [_logs addObject:log];
}

- (NSArray<MDMTransactionLog *> *)logs {
  return _logs;
}

@end

@implementation MDMTransactionLog
@end
