/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Eshop : Codable {
	let nick_name : String?
	let eshop_id : Int?
	let eshop_locations : [String]?
	let site_id : String?
	let eshop_logo_url : String?
	let eshop_status_id : Int?
	let seller : Int?
	let eshop_experience : Int?

	enum CodingKeys: String, CodingKey {

		case nick_name = "nick_name"
		case eshop_id = "eshop_id"
		case eshop_locations = "eshop_locations"
		case site_id = "site_id"
		case eshop_logo_url = "eshop_logo_url"
		case eshop_status_id = "eshop_status_id"
		case seller = "seller"
		case eshop_experience = "eshop_experience"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		nick_name = try values.decodeIfPresent(String.self, forKey: .nick_name)
		eshop_id = try values.decodeIfPresent(Int.self, forKey: .eshop_id)
		eshop_locations = try values.decodeIfPresent([String].self, forKey: .eshop_locations)
		site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
		eshop_logo_url = try values.decodeIfPresent(String.self, forKey: .eshop_logo_url)
		eshop_status_id = try values.decodeIfPresent(Int.self, forKey: .eshop_status_id)
		seller = try values.decodeIfPresent(Int.self, forKey: .seller)
		eshop_experience = try values.decodeIfPresent(Int.self, forKey: .eshop_experience)
	}

}
