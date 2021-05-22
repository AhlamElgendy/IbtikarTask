//
//  CategoriesRepository.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
import RxSwift
class CategoriesRepository: ICategoriesRepository{
  
    
    let dataSource : CategoriesDataSource
    init(dataSource:CategoriesDataSource){
        self.dataSource = dataSource
    }
    
    func getChannels() -> Observable<[Channel]> {
        return dataSource.getChannels().map { (response)  in
            (response.data?.channels ?? [])
    }
    }
        
    func getCategories() -> Observable<[CategoryItem]> {
        return dataSource.getCategories().map { (response)  in
            (response.data?.categories ?? [])
    }
    }
    
    func getNewEpisodes() -> Observable<[Media]> {
        return dataSource.getNewEpisodes().map { (response)  in
            (response.data?.media ?? [])
    }
    }
   
}
