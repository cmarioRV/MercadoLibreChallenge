/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Metrics : Codable {
	let claims : Claims?
	let delayed_handling_time : Delayed_handling_time?
	let sales : Sales?
	let cancellations : Cancellations?

	enum CodingKeys: String, CodingKey {

		case claims = "claims"
		case delayed_handling_time = "delayed_handling_time"
		case sales = "sales"
		case cancellations = "cancellations"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		claims = try values.decodeIfPresent(Claims.self, forKey: .claims)
		delayed_handling_time = try values.decodeIfPresent(Delayed_handling_time.self, forKey: .delayed_handling_time)
		sales = try values.decodeIfPresent(Sales.self, forKey: .sales)
		cancellations = try values.decodeIfPresent(Cancellations.self, forKey: .cancellations)
	}

}