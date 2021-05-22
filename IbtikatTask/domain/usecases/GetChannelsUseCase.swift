//
//  GetChannelsUseCase.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
import RxSwift
class GetChannelsUseCase{
    let repository:ICategoriesRepository
    init(repository:ICategoriesRepository) {
        self.repository = repository
    }
     func excute() -> Observable<[Channel]> {
        return repository.getChannels()
    }
}
