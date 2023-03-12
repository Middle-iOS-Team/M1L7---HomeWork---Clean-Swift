//
//  TaskManagerTests.swift
//  TaskManagerTests
//
//  Created by Irina Moiseeva on 12.03.2023.
//

import XCTest
@testable import TodoList

final class TaskManagerTests: XCTestCase {
    
    func testAllTasks() {
        let sut = makeSut()
        let tasks = [Task(title: "Test Task 1"), Task(title: "Test Task 2")]
        
        sut.addTasks(tasks: tasks)

        XCTAssertEqual(sut.allTasks().count, 2)
    }
    
    func testCompletedTasks() {
        let sut = makeSut()
        let tasks = [Task(title: "Test Task 1", isComplete: true), Task(title: "Test Task 2", isComplete: false)]
        
        sut.addTasks(tasks: tasks)
        
        XCTAssertEqual(sut.completedTasks().count, 1)
    }
    
    func testUncompletedTasks() {
        let sut = makeSut()
        let tasks = [Task(title: "Test Task 1", isComplete: true), Task(title: "Test Task 2", isComplete: false)]
        
        sut.addTasks(tasks: tasks)
        
        XCTAssertEqual(sut.uncompletedTasks().count, 1)
    }
    
    func testAddTask() {
        let sut = makeSut()
        let task = Task(title: "Test Task")
        
        sut.addTask(task: task)
        
        XCTAssertEqual(sut.allTasks().count, 1)
    }
    
    func testAddTasks() {
        let sut = makeSut()
        let tasks = [Task(title: "Test Task 1", isComplete: true), Task(title: "Test Task 2", isComplete: false)]
        
        sut.addTasks(tasks: tasks)
        
        XCTAssertEqual(sut.allTasks().count, 2)
    }
    
    func testRemoveTask() {
        let sut = makeSut()
        let task = Task(title: "Test Task")
        
        sut.addTask(task: task)
        sut.removeTask(task: task)
        
        XCTAssertEqual(sut.allTasks().count, 0)
    }

    private func makeSut() -> TaskManager {
        TaskManager()
    }
}
