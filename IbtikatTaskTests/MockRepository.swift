//
//  MockDataSource.swift
//  IbtikatTaskTests
//
//  Created by Ahlam on 21/5/2021.
//
@testable import IbtikatTask
import RxSwift
import Foundation
class MockRepository: ICategoriesRepository{
    
    func getChannels() -> Observable<[Channel]> {
        return Observable.just([])
    }
    
        
    func getCategories() -> Observable<[CategoryItem]> {
        return  Observable.just([CategoryItem(name: "TEST")])
    }
    
    func getNewEpisodes() -> Observable<[Media]> {
        return  Observable.just([])
    }
   
}
