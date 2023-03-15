//
//  OrderedTaskManagerTests.swift
//  TodoListTests
//
//  Created by Mac on 12.03.2023.
//

import XCTest
@testable import TaskModule

final class OrderedTaskManagerTests: XCTestCase {
	
	private func setupSUT() -> OrderedTaskManager {
		let taskManager = MockTaskManager()
		return OrderedTaskManager(taskManager: taskManager)
	}
	
	func test_init_OrderedTaskManagerInitializedWithTaskManager() {
		// Arrange & Act
		let sut = setupSUT()
		// Assert
		XCTAssertNotNil(sut.taskManager)
	}
	
	func test_allTasks_OrderedTaskManagerReturnsSortedTasks() {
		// Arrange
		let sut = setupSUT()
		var tasksStringResult = ""
		let expectedStringResult = "bazbarfoo"
		// Act
		let tasks = sut.allTasks()
		
		for task in tasks {
			tasksStringResult.append(task.title)
		}
		// Assert
		XCTAssertEqual(tasksStringResult, expectedStringResult)
	}
	
	func test_completedTasks_ReturnsEmptyIfThereIsNoCompletedTasks() {
		// Arrange
		let sut = setupSUT()
		// Act
		let tasks = sut.completedTasks()
		// Assert
		XCTAssertTrue(tasks.isEmpty)
	}
	
	func test_completedTasks_ReturnsSortedCompletedTasks() {
		// Arrange
		let sut = setupSUT()
		sut.allTasks()[0].isComplete.toggle()
		sut.allTasks()[2].isComplete.toggle()
		var tasksStringResult = ""
		let expectedStringResult = "bazfoo"
		// Act
		let tasks = sut.completedTasks()
		
		for task in tasks {
			tasksStringResult.append(task.title)
		}
		// Assert
		XCTAssertEqual(tasksStringResult, expectedStringResult)
	}
	
	func test_uncompletedTasks_ReturnsEmptyIfThereIsNoCompletedTasks() {
		// Arrange
		let sut = setupSUT()
		for task in sut.allTasks() {
			task.isComplete.toggle()
		}
		// Act
		let tasks = sut.uncompletedTasks()
		// Assert
		XCTAssertTrue(tasks.isEmpty)
	}
	
	func test_uncompletedTasks_ReturnsSortedUncompletedTasks() {
		// Arrange
		let sut = setupSUT()
		sut.allTasks()[0].isComplete.toggle()
		var tasksStringResult = ""
		let expectedStringResult = "barfoo"
		// Act
		let tasks = sut.uncompletedTasks()
		
		for task in tasks {
			tasksStringResult.append(task.title)
		}
		// Assert
		XCTAssertEqual(tasksStringResult, expectedStringResult)
	}
	
	func test_addTasks_addsNewTask() {
		// Arrange
		let sut = setupSUT()
		let tasksToAdd = [ImportantTask(title: "foo", taskPriority: .high)]
		// Act
		sut.addTasks(tasks: tasksToAdd)
		// Assert
		XCTAssertEqual(sut.allTasks().count, 4)
	}

	func test_addTasks_addsNewTasks() {
		// Arrange
		let sut = setupSUT()
		let tasksToAdd = [ImportantTask(title: "foo", taskPriority: .high),
						  RegularTask(title: "bar")]
		// Act
		sut.addTasks(tasks: tasksToAdd)
		// Assert
		XCTAssertEqual(sut.allTasks().count, 5)
	}
}

final class MockTaskManager: ITaskManager {

	let stubTasks = StubTasks()

	func allTasks() -> [Task] {
		return stubTasks.tasks
	}
	
	func completedTasks() -> [Task] {
		return stubTasks.tasks.filter { $0.isComplete }
	}
	
	func uncompletedTasks() -> [Task] {
		return stubTasks.tasks.filter { !$0.isComplete }
	}
	
	func addTasks(tasks: [Task]) {
		for task in tasks {
			stubTasks.tasks.append(task)
		}
	}
}

final class StubTasks {
	private let taskOne = RegularTask(title: "foo")
	private let taskTwo = RegularTask(title: "bar")
	private let taskThree = ImportantTask(title: "baz", taskPriority: .low)

	lazy var tasks: [Task] = {
		[taskOne, taskTwo, taskThree]
	}()
}
