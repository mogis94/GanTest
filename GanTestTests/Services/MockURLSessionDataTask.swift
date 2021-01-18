//
//  MockURLSessionDataTask.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//


import Foundation
@testable import GanTest

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
    
    func cancel() {
        
    }
}
