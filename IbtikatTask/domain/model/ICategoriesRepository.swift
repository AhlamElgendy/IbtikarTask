//
//  ICategoriesRepository.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//
import RxSwift
import Foundation
protocol ICategoriesRepository {
    func getCategories() -> Observable<[CategoryItem]>
    func getChannels() -> Observable<[Channel]>
    func getNewEpisodes() -> Observable<[Media]>
}
