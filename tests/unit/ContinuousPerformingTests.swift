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

import XCTest
import MaterialMotionRuntime

// Tests related to continuous performers.
class ContinuousPerformingTests: XCTestCase {

  func testContinuousPerformerCausesActivityStateChange() {
    let scheduler = Scheduler()

    let delegate = TestSchedulerDelegate()
    scheduler.delegate = delegate

    let transaction = Transaction()
    transaction.add(plan: InstantlyContinuous(), to: NSObject())
    scheduler.commit(transaction: transaction)

    XCTAssertTrue(delegate.activityStateDidChange)
    XCTAssertTrue(scheduler.activityState == .idle)
  }

  func testForeverContinuousPerformerCausesActivityStateChange() {
    let scheduler = Scheduler()

    let delegate = TestSchedulerDelegate()
    scheduler.delegate = delegate

    let transaction = Transaction()
    transaction.add(plan: ForeverContinuous(), to: NSObject())
    scheduler.commit(transaction: transaction)

    XCTAssertTrue(delegate.activityStateDidChange)
    XCTAssertTrue(scheduler.activityState == .active)
  }
}
