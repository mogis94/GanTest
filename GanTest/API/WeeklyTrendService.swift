//
//  WeeklyTrendService.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import Foundation

class WeeklyTrendService: BaseService {
	
	func fetch (completionHandler: @escaping (Result<[Product], ServiceFetchError>) -> Void) {
		
		fetch(listOf: [Product].self, withURL: url(withPath: APIConstants.urls.characters)) { (result) in
			switch result {
			case .success(let events):
				completionHandler(Result.success(events))
			case .failure(let error):
				completionHandler(Result.failure(error))
			}
		}
	}
}
