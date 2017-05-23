//
//  Category.swift
//  NaviNews
//
//  Created by YY's MacBook Pro on 2017/5/21.
//  Copyright © 2017年 YY's MacBook Pro. All rights reserved.
//

import Foundation
import ObjectMapper
import Moya

struct CategoryIndexResponse: Mappable{
    var status:String!
    var count: Int!
    var categories: [Category]!
    
    init?(map: Map){
        
    }
    mutating func mapping(map: Map){
        status <- map["status"]
        count <- map["count"]
        categories <- map["categories"]
        
    }
    
    
}

struct Category: Mappable {
    var id : Int!
    var title : String!
    var count : Int!
    
    init?(map: Map) {
      
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        count <- map["post_count"]
    }
}

extension Category{
    static func request(completion: @escaping ([Category]?) -> Void ) {
        let provider = MoyaProvider<NetworkService>()
        provider.request(.catgory) { (result) in
            switch result{
            case let .success(moyaResponse):
                let json = try! moyaResponse.mapJSON() as! [String:Any]
                if let jsonReponse = CategoryIndexResponse(JSON: json){
                    print(jsonReponse.status, jsonReponse.count, jsonReponse.categories)
                    completion(jsonReponse.categories)
                }
            case .failure:
                print("网络请求出错")
            }
        }
    }
}
