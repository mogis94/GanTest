//
//  DecodingHelper.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//


import Foundation

struct DecodableHelper {
	
	static func decode<T: Decodable>(_ decodable: T.Type, dictionary: [String: Any]) -> T? {
		guard let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else {
			return nil
		}
		return try? JSONDecoder().decode(T.self, from: jsonData)
	}
}
