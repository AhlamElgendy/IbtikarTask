//
//  ServiceLayer.swift
//  Glamera
//
//  Created by Ahlam on 7/6/20.
//  Copyright © 2020 Ahlam. All rights reserved.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift
import RxAlamofire


class ServiceLayer: NSObject {
    class func  apiGenaric<T: Codable,R:Encodable>(hTTPMethod: HTTPMethod,service: String,
                                                        parameters: R? = nil,
                                                        domainUrl: String? = nil,
                                                        headers:  HTTPHeaders? = nil) -> Observable<T>{
        
        var appHeaders : HTTPHeaders = headers ?? []
        appHeaders.add(name: "Content-Type", value: "application/json")
//        appHeaders.add(name: "Lang", value: "\(Language.language.rawValue)")
//        let token = UserDefaults.standard.string(forKey: Constants.userToken)
//        if token != "" && token != nil{
//            appHeaders.add(name: "Authorization", value: "Bearer \(token!)")
//        }
        
//        let countryId = UserDefaults.standard.string(forKey: Constants.country_id)
//        if countryId != "" && countryId != nil{
//            appHeaders.add(name: "CountryId", value: "\(countryId!)")
//        }
//        let cityId = UserDefaults.standard.string(forKey: Constants.city_id)
//               if cityId != "" && cityId != nil{
//                   appHeaders.add(name: "CityId", value: "\(cityId!)")
//               }
        
        print("✍🏻 Header: \(String(describing: appHeaders))")
        return NetowrkHelper.networkRequester(hTTPMethod: hTTPMethod, service: service,parameters: parameters,domainUrl: domainUrl,headers: appHeaders)
    }
    class func  apiGenaric<T: Codable>(hTTPMethod: HTTPMethod,service: String,
                                            parameters: [String:String]? = nil,
                                            domainUrl: String? = nil,
                                            headers:  HTTPHeaders? = nil) -> Observable<T>{
        
        var appHeaders : HTTPHeaders = headers ?? []
        appHeaders.add(name: "Content-Type", value: "application/json")
//        appHeaders.add(name: "Lang", value: "\(Language.language.rawValue)")
//        let token = UserDefaults.standard.string(forKey: Constants.userToken)
//        if token != "" && token != nil{
//            appHeaders.add(name: "Authorization", value: "Bearer \(token!)")
//        }
//        let countryId = UserDefaults.standard.string(forKey: Constants.country_id)
//        if countryId != "" && countryId != nil{
//            appHeaders.add(name: "CountryId", value: "\(countryId!)")
//        }
//        let cityId = UserDefaults.standard.string(forKey: Constants.city_id)
//                     if cityId != "" && cityId != nil{
//                         appHeaders.add(name: "CityId", value: "\(cityId!)")
//                     }
        print("✍🏻 Header: \(String(describing: appHeaders))")
        return NetowrkHelper.networkRequester(hTTPMethod: hTTPMethod, service: service,parameters: parameters,domainUrl: domainUrl,headers: appHeaders)
    }
    
//    class func  hyperPayCall<T: GeneralModel,R:Encodable>(hTTPMethod: HTTPMethod,service: String,
//                                                           parameters: R? = nil,
//                                                           domainUrl: String? = nil,
////                                                           headers:  HTTPHeaders? = nil) -> Observable<T>{
//
//           var appHeaders : HTTPHeaders = headers ?? []
//           appHeaders.add(name: "Content-Type", value: "application/json")
//           appHeaders.add(name: "Lang", value: "\(Language.language.rawValue)")
//           let token = "OGE4Mjk0MTc0YjdlY2IyODAxNGI5Njk5MjIwMDE1Y2N8c3k2S0pzVDg="
//
//            appHeaders.add(name: "Authorization", value: "Bearer \(token)")
//
//
//           print("✍🏻 Header: \(String(describing: appHeaders))")
//           return NetowrkHelper.networkRequester(hTTPMethod: hTTPMethod, service: service,parameters: parameters,domainUrl: domainUrl,headers: appHeaders)
//       }
}
