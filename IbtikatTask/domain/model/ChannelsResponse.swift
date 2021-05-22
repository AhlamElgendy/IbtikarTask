//
//  ChannelsResponse.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let response = try? newJSONDecoder().decode(Response.self, from: jsonData)

import Foundation



// MARK: - DataClass
class ChannelsResponse: Codable {
    var channels: [Channel]?

    enum CodingKeys: String, CodingKey {
        case channels = "channels"
    }

    init(channels: [Channel]?) {
        self.channels = channels
    }
}

// MARK: - Channel
class Channel: Codable {
    var title: String?
    var series: [Series]?
    var mediaCount: Int?
    var latestMedia: [LatestMedia]?
    var id: String?
    var iconAsset: IconAsset?
    var coverAsset: ChannelCoverAsset?
    var slug: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case series = "series"
        case mediaCount = "mediaCount"
        case latestMedia = "latestMedia"
        case id = "id"
        case iconAsset = "iconAsset"
        case coverAsset = "coverAsset"
        case slug = "slug"
    }

    init(title: String?, series: [Series]?, mediaCount: Int?, latestMedia: [LatestMedia]?, id: String?, iconAsset: IconAsset?, coverAsset: ChannelCoverAsset?, slug: String?) {
        self.title = title
        self.series = series
        self.mediaCount = mediaCount
        self.latestMedia = latestMedia
        self.id = id
        self.iconAsset = iconAsset
        self.coverAsset = coverAsset
        self.slug = slug
    }
}

// MARK: - ChannelCoverAsset
class ChannelCoverAsset: Codable {
    var url: String?

    enum CodingKeys: String, CodingKey {
        case url = "url"
    }

    init(url: String?) {
        self.url = url
    }
}

// MARK: - IconAsset
class IconAsset: Codable {
    var thumbnailUrl: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailUrl = "thumbnailUrl"
        case url = "url"
    }

    init(thumbnailUrl: String?, url: String?) {
        self.thumbnailUrl = thumbnailUrl
        self.url = url
    }
}

// MARK: - LatestMedia
class LatestMedia: Codable {
    var type: String?
    var title: String?
    var coverAsset: LatestMediaCoverAsset?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case title = "title"
        case coverAsset = "coverAsset"
    }

    init(type: String?, title: String?, coverAsset: LatestMediaCoverAsset?) {
        self.type = type
        self.title = title
        self.coverAsset = coverAsset
    }
}

// MARK: - LatestMediaCoverAsset
class LatestMediaCoverAsset: Codable {
    var url: String?

    enum CodingKeys: String, CodingKey {
        case url = "url"
    }

    init(url: String?) {
        self.url = url
    }
}

// MARK: - Series
class Series: Codable {
    var title: String?
    var coverAsset: ChannelCoverAsset?
    var id: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case coverAsset = "coverAsset"
        case id = "id"
    }

    init(title: String?, coverAsset: ChannelCoverAsset?, id: String?) {
        self.title = title
        self.coverAsset = coverAsset
        self.id = id
    }
}
