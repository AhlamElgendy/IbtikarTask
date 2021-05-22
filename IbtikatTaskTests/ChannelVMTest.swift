//
//  ChannelVMTest.swift
//  IbtikatTaskTests
//
//  Created by Ahlam on 21/5/2021.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
@testable import IbtikatTask
class ChannelVMTest: XCTestCase {
    let getCategoriesUseCase = GetCategoriesUseCase(repository: MockRepository())
    let channellsUseCas = GetChannelsUseCase(repository: MockRepository())
    let newEpisodesUseCase = GetNewEpisodeUseCase(repository: MockRepository())
    var viewModel:ChannelVM? = nil
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!

    override func setUp() {
            super.setUp()
            self.scheduler = TestScheduler(initialClock: 0)
            self.disposeBag = DisposeBag()
            self.viewModel = ChannelVM(channelUseCase: channellsUseCas, categoriesUseCase: getCategoriesUseCase,newEpisodesUseCase: newEpisodesUseCase)
        }
    
    func testLoading(){
        let sink = scheduler.createObserver(ChannelsVS.self)
        self.viewModel?.vs.bind(to: sink).disposed(by: disposeBag)
        self.viewModel?.getData()
        scheduler.start()
        XCTAssertEqual(sink.events, [.next(0,ChannelsVS(loading:true))])
    }
}
