//
//  URLSessionDataTaskProtocol.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
    func cancel()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
