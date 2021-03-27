/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Attributes : Codable {
	let name : String?
	let value_id : String?
	let value_name : String?
	let value_struct : String?
	let attribute_group_id : String?
	let attribute_group_name : String?
	let source : Int?
	let id : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case value_id = "value_id"
		case value_name = "value_name"
		case value_struct = "value_struct"
		case attribute_group_id = "attribute_group_id"
		case attribute_group_name = "attribute_group_name"
		case source = "source"
		case id = "id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		value_id = try values.decodeIfPresent(String.self, forKey: .value_id)
		value_name = try values.decodeIfPresent(String.self, forKey: .value_name)
		value_struct = try values.decodeIfPresent(String.self, forKey: .value_struct)
		attribute_group_id = try values.decodeIfPresent(String.self, forKey: .attribute_group_id)
		attribute_group_name = try values.decodeIfPresent(String.self, forKey: .attribute_group_name)
		source = try values.decodeIfPresent(Int.self, forKey: .source)
		id = try values.decodeIfPresent(String.self, forKey: .id)
	}

}