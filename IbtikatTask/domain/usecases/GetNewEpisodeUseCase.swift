//
//  GetNewEpisodeUseCase.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//
import RxSwift
import Foundation
class GetNewEpisodeUseCase{
    let repository:ICategoriesRepository
    init(repository:ICategoriesRepository) {
        self.repository = repository
    }
     func excute() -> Observable<[Media]> {
        return repository.getNewEpisodes()
    }
}
