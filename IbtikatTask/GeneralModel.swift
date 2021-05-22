//
//  GeneralModel.swift
//  IbtikatTask
//
//  Created by Ahlam on 19/5/2021.
//

import Foundation

protocol GeneralModel:Codable {
    var State : Int! {get set}
    var Message : String! {get set}
}


class GenericModel: GeneralModel {
    
    var State: Int!
    var Message: String!
    
}
