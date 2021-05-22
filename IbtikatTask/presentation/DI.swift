//
//  DI.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
let dependencies = DI()
class DI: NSObject {
    lazy var dataSource = CategoriesDataSource()
    lazy var repository = CategoriesRepository(dataSource: dataSource)
    lazy var categoriesUseCase = GetCategoriesUseCase(repository: repository)
    lazy var channelsUseCase = GetChannelsUseCase(repository: repository)
    lazy var newEpisodesUseCase = GetNewEpisodeUseCase(repository: repository)

    lazy var channelsVM = ChannelVM(channelUseCase: channelsUseCase, categoriesUseCase: categoriesUseCase,newEpisodesUseCase: newEpisodesUseCase)
}
