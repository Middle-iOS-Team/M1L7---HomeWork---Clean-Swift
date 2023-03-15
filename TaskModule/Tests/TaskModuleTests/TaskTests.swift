//
//  TasksTests.swift
//  TodoListTests
//
//  Created by Ульяна Гритчина on 12.03.2023.
//

import XCTest
@testable import TaskModule

final class TaskTests: XCTestCase {
    
    func test_Task_title_shoudleBeTitle() {
        let title = "Title"
        
        let task = Task(title: title, isComplete: false)
        
        XCTAssertEqual(title, task.title)
    }
    
    func test_Task_isComplete_shoudleBeTrue() {
        let isComplete = true
        
        let task = Task(title: "Title", isComplete: isComplete)
        
        XCTAssertTrue(task.isComplete)
    }
    
    func test_Task_isComplete_shoudleBeFalse() {
        let isComplete = false
        
        let task = Task(title: "Title", isComplete: isComplete)
        
        XCTAssertFalse(task.isComplete)
    }

}


