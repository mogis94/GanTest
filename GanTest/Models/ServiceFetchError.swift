//
//  FetchError.swift
//  GanTest
//
//  Created by Mogis Ahmad on 11/12/20.
//

import Foundation

enum ServiceFetchError: Error {
	case invalidJSON
	case decodingError
	case invalidURL
	case networkFailed
	case limit
}
