//
//  GetCategoriesUseCase.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
import RxSwift
class GetCategoriesUseCase{
    let repository:ICategoriesRepository
    init(repository:ICategoriesRepository) {
        self.repository = repository
    }
     func excute() -> Observable<[CategoryItem]> {
        return repository.getCategories()
    }
}
