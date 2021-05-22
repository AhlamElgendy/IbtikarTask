//
//  ChannelsResponse.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

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
    var series: [Media]?
    var mediaCount: Int?
    var latestMedia: [Media]?
    var id: String?
    var iconAsset: ImageAsset?
    var coverAsset: ImageAsset?
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

    init(title: String?, series: [Media]?, mediaCount: Int?, latestMedia: [Media]?, id: String?, iconAsset: ImageAsset?, coverAsset: ImageAsset?, slug: String?) {
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


// MARK: - IconAsset
class ImageAsset: Codable {
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



// MARK: - Series
class Media: Codable {
    var type: String?
    var title: String?
    var coverAsset: ImageAsset?
    var id: String?
    var channel:Channel?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case title = "title"
        case coverAsset = "coverAsset"
        case id = "id"
        case channel = "channel"
    }

    init(title: String?, coverAsset: ImageAsset?, id: String?,channel:Channel?) {
        self.title = title
        self.coverAsset = coverAsset
        self.id = id
        self.channel = channel
    }
}
