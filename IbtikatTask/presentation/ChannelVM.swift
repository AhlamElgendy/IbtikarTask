//
//  ChannelVM.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
import RxSwift
import RxRelay

class ChannelsVS : Equatable {
    static func == (lhs: ChannelsVS, rhs: ChannelsVS) -> Bool {
        return lhs.loading == rhs.loading
    }
    
    
    
   
    
    init(channels:[Channel] = [],
     categories:[CategoryItem]=[],
     newEpisodes:[Media] = [],
     loading:Bool = false,
     error:Error? = nil) {
        self.channels = channels
        self.categories = categories
        self.newEpisodes = newEpisodes
        self.loading = loading
        self.error = error
    }
    
    var channels:[Channel] = []
    var categories:[CategoryItem] = []
    var newEpisodes:[Media] = []
    var loading:Bool = false
    var error:Error? = nil
}

class ChannelVM{
    let channelUseCase:GetChannelsUseCase
    let categoriesUseCase:GetCategoriesUseCase
    let newEpisodesUseCase:GetNewEpisodeUseCase
    init(channelUseCase:GetChannelsUseCase, categoriesUseCase:GetCategoriesUseCase,
        newEpisodesUseCase:GetNewEpisodeUseCase) {
        self.categoriesUseCase = categoriesUseCase
        self.channelUseCase = channelUseCase
        self.newEpisodesUseCase = newEpisodesUseCase
    }
    let compositDisposable = DisposeBag()
    let vs = PublishRelay<ChannelsVS>()
    var currentVs = ChannelsVS(){
        didSet{
            vs.accept(currentVs)
        }
    }
    func observeVS( handler:@escaping (ChannelsVS)->Void){
        vs.observeOn(MainScheduler.instance)
            .subscribe{(state) in
            handler(state)
        }.disposed(by: compositDisposable)
    }
   
    
    func getData() {
        let concurrentBackground = ConcurrentDispatchQueueScheduler.init(qos: .background)
        let main = MainScheduler.instance
       Observable.zip(
        channelUseCase.excute(),
        categoriesUseCase.excute(),
        newEpisodesUseCase.excute())
        {(channels,categories,newEpisodes) in
        ChannelsVS(channels: channels, categories:categories, newEpisodes:newEpisodes)
        }
        .observeOn(concurrentBackground)
        .subscribeOn(main)
       .startWith(ChannelsVS(loading:true))
       .do(onNext: { (vs) in
        self.currentVs = vs
       })
       .subscribe (onNext: { (vs) in
       
       },onError: {(error) in
            self.currentVs = ChannelsVS(error:error)
        }).disposed(by: compositDisposable)
    }
    
}
