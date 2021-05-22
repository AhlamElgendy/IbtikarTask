//
//  NetowrkHelper.swift
//  Glamera
//
//  Created by Ahlam on 7/6/20.
//  Copyright © 2020 Ahlam. All rights reserved.
//


import Foundation
import Alamofire
import RxSwift
class NetowrkHelper {
    //Core Function of network
    internal static func networkRequester<T: Codable,R:Encodable>(hTTPMethod: HTTPMethod,service: String,
                                                                       parameters: R? = nil,
                                                                       domainUrl: String? = nil,
                                                                       headers: HTTPHeaders? = nil) -> Observable<T>
        
    {
        
        return Observable.create{ observer in
            let initialURL =
                (domainUrl == nil ? "https://pastebin.com/raw/" : domainUrl!)+service;
            
            print("✍🏻 Request URL >>>> " + initialURL)
            
            if let parameters = parameters {
                print("✍🏻 Request Body >>>>  \(parameters)")
            }
            

            AF.request(initialURL, method: hTTPMethod, parameters: parameters, encoder: JSONParameterEncoder.default,headers: headers)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .failure(let error):
                        print("❌ Respons Error >>>> " + error.localizedDescription)
                        if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                            print("❌ Respons Error Details >>>> \(responseString)")
                            
                            do{
                                if let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]{
                                    let message = jsonData["Message"] as? String
                                    observer.onError("\(message ?? "")")
                                    observer.onCompleted()
                                }
                                
                            }catch {
                                observer.onError(error)
                                observer.onCompleted()
                            }
                            
                        }else{
                            observer.onError(error)
                            observer.onCompleted()
                        }
                    case .success:
                        print("✅ Respons Object >>>>  \(response)")
                    
                            observer.onNext(response.value!)
                            observer.onCompleted()}
            }
            return Disposables.create()
        }
        
        
    }
    
}



//extension String: Error {}
