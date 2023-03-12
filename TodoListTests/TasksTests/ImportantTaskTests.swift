//
//  ImportantTaskTests.swift
//  TodoListTests
//
//  Created by Ульяна Гритчина on 12.03.2023.
//

import XCTest
@testable import TodoList

final class ImportantTaskTests: XCTestCase {
    
    func test_ImportantTaskTests_taskPriority_shoudeBeLow() {
        let taskPriority: ImportantTask.TaskPriority = .low
        
        let importantTask = ImportantTask(title: "Title", taskPriority: taskPriority)
        
        XCTAssertEqual(taskPriority, importantTask.taskPriority)
    }
    
    func test_ImportantTaskTests_deadLine_shoudeBeOneDayAfterCreated() {
        let taskPriority: ImportantTask.TaskPriority = .high
        let createDate = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: createDate)!
        
        let importantTask = ImportantTask(
            title: "Title",
            taskPriority: taskPriority,
            createDate: createDate
        )
        
        XCTAssertEqual(tomorrow, importantTask.deadLine)
    }
    
    func test_ImportantTaskTests_deadLine_shoudeBeTwoDayesAfterCreated() {
        let taskPriority: ImportantTask.TaskPriority = .medium
        let createDate = Date()
        let dayAfterTomorrow = Calendar.current.date(byAdding: .day, value: 2, to: createDate)!
        
        let importantTask = ImportantTask(
            title: "Title",
            taskPriority: taskPriority,
            createDate: createDate
        )
        
        XCTAssertEqual(dayAfterTomorrow, importantTask.deadLine)
    }
    
    func test_ImportantTaskTests_deadLine_shoudeBeTreeDayesAfterCreated() {
        let taskPriority: ImportantTask.TaskPriority = .low
        let createDate = Date()
        let dayAfterPlsTomorrow = Calendar.current.date(byAdding: .day, value: 3, to: createDate)!
        
        let importantTask = ImportantTask(
            title: "Title",
            taskPriority: taskPriority,
            createDate: createDate
        )
        
        XCTAssertEqual(dayAfterPlsTomorrow, importantTask.deadLine)
    }
    
}


