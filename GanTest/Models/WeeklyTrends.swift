//
//  WeeklyTrendsResponse.swift
//  GanTest
//
//  Created by Mogis Ahmad on 11/12/20.
//

import Foundation

// MARK: - WeeklyTrendsResponse

struct WeeklyTrends: Codable {
	let products: [Product]
	let title: String
	let productCount: Int

	enum CodingKeys: String, CodingKey {
		case products, title
		case productCount = "product_count"
	}
}

// MARK: - Product
struct Product: Codable {
	let char_id: Int
	let name: String
	let occupation: [String]
	let img: String
	let status: String
	let nickname: String
	let birthday: String
	let portrayed: String
	let category: String
	let bs: [Int]
	let appearance: [Int]
	
	enum CodingKeys: String, CodingKey {
		case char_id = "char_id"
		case bs = "better_call_saul_appearance"
		case name = "name"
		case occupation = "occupation"
		case img = "img"
		case status = "status"
		case nickname = "nickname"
		case appearance = "appearance"
		case birthday = "birthday"
		case portrayed = "portrayed"
		case category = "category"
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		char_id = try container.decodeIfPresent(Int.self, forKey: .char_id) ?? 0
		name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
		occupation = try container.decodeIfPresent([String].self, forKey: .occupation) ?? [""]
		img = try container.decodeIfPresent(String.self, forKey: .img) ?? ""
		status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
		nickname = try container.decodeIfPresent(String.self, forKey: .nickname) ?? ""
		birthday = try container.decodeIfPresent(String.self, forKey: .birthday) ?? ""
		portrayed = try container.decodeIfPresent(String.self, forKey: .portrayed) ?? ""
		category = try container.decodeIfPresent(String.self, forKey: .category) ?? ""
		bs = try container.decodeIfPresent([Int].self, forKey: .bs) ?? [0]
		appearance = try container.decodeIfPresent([Int].self, forKey: .appearance) ?? [0]
		
	}
}

