//
//  NewEpisodeResponse.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
// MARK: - DataClass
class NewEpisodeResponse : Codable {
    var media: [Media]?

    enum CodingKeys: String, CodingKey {
        case media = "media"
    }

    init(media: [Media]?) {
        self.media = media
    }
}
