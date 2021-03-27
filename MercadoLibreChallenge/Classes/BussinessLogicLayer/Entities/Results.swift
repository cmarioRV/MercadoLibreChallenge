/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Results : Codable {
	let id : String?
	let site_id : String?
	let title : String?
	let seller : Seller?
	let price : Int?
	let currency_id : String?
	let available_quantity : Int?
	let sold_quantity : Int?
	let buying_mode : String?
	let listing_type_id : String?
	let stop_time : String?
	let condition : String?
	let permalink : String?
	let thumbnail : String?
	let accepts_mercadopago : Bool?
	let installments : Installments?
	let address : Address?
	let shipping : Shipping?
	let seller_address : Seller_address?
	let attributes : [Attributes]?
	let original_price : String?
	let category_id : String?
	let official_store_id : Int?
	let catalog_product_id : String?
	let tags : [String]?
	let catalog_listing : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case site_id = "site_id"
		case title = "title"
		case seller = "seller"
		case price = "price"
		case currency_id = "currency_id"
		case available_quantity = "available_quantity"
		case sold_quantity = "sold_quantity"
		case buying_mode = "buying_mode"
		case listing_type_id = "listing_type_id"
		case stop_time = "stop_time"
		case condition = "condition"
		case permalink = "permalink"
		case thumbnail = "thumbnail"
		case accepts_mercadopago = "accepts_mercadopago"
		case installments = "installments"
		case address = "address"
		case shipping = "shipping"
		case seller_address = "seller_address"
		case attributes = "attributes"
		case original_price = "original_price"
		case category_id = "category_id"
		case official_store_id = "official_store_id"
		case catalog_product_id = "catalog_product_id"
		case tags = "tags"
		case catalog_listing = "catalog_listing"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		seller = try values.decodeIfPresent(Seller.self, forKey: .seller)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
		currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
		available_quantity = try values.decodeIfPresent(Int.self, forKey: .available_quantity)
		sold_quantity = try values.decodeIfPresent(Int.self, forKey: .sold_quantity)
		buying_mode = try values.decodeIfPresent(String.self, forKey: .buying_mode)
		listing_type_id = try values.decodeIfPresent(String.self, forKey: .listing_type_id)
		stop_time = try values.decodeIfPresent(String.self, forKey: .stop_time)
		condition = try values.decodeIfPresent(String.self, forKey: .condition)
		permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		accepts_mercadopago = try values.decodeIfPresent(Bool.self, forKey: .accepts_mercadopago)
		installments = try values.decodeIfPresent(Installments.self, forKey: .installments)
		address = try values.decodeIfPresent(Address.self, forKey: .address)
		shipping = try values.decodeIfPresent(Shipping.self, forKey: .shipping)
		seller_address = try values.decodeIfPresent(Seller_address.self, forKey: .seller_address)
		attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
		original_price = try values.decodeIfPresent(String.self, forKey: .original_price)
		category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
		official_store_id = try values.decodeIfPresent(Int.self, forKey: .official_store_id)
		catalog_product_id = try values.decodeIfPresent(String.self, forKey: .catalog_product_id)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		catalog_listing = try values.decodeIfPresent(Bool.self, forKey: .catalog_listing)
	}

}