//
//  CategoriesDataSource.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//
import RxSwift
import Foundation
private let CATEGORIES = "A0CgArX3"
private let CHANNELS = "Xt12uVhM"
private let NEW_EPISODE = "z5AExTtw"
class CategoriesDataSource {
    
    func getCategories() -> Observable<Response<CategoriesResponse>> {
        return ServiceLayer.apiGenaric(
            hTTPMethod: .get,
            service:CATEGORIES
        )
    }
    
    func getChannels() -> Observable<Response<ChannelsResponse>> {
        return ServiceLayer.apiGenaric(
            hTTPMethod: .get,
            service:CHANNELS
        )
    }
    
    func getNewEpisodes() -> Observable<Response<NewEpisodeResponse>> {
        return ServiceLayer.apiGenaric(
            hTTPMethod: .get,
            service:NEW_EPISODE
        )
    }
}
