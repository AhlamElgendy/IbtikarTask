//
//  Response.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
// MARK: - Response
class Response<T:Codable>: Codable {
    var data: T?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    init(data: T?) {
        self.data = data
    }
}


