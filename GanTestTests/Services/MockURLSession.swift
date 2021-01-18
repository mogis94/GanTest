//
//  MockURLSession.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//


import XCTest
import Foundation
@testable import GanTest

class MockURLSession: URLSessionProtocol {
    private (set) var lastURL: URL?
    var nextDataTask = MockURLSessionDataTask()
    var nextResponse: HTTPURLResponse?
    var nextData: Data?
    var nextError: ServiceFetchError?
    
    func data(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
}
