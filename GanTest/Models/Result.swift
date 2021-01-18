//
//  Result.swift
//  GanTest
//
//  Created by Mogis Ahmad on 11/12/20.
//

import Foundation

enum Result<T, E: Error> {
	case success(T)
	case failure(E)
}
