//
//  NetworkService.swift
//  NaviNews
//
//  Created by YY's MacBook Pro on 2017/5/20.
//  Copyright © 2017年 YY's MacBook Pro. All rights reserved.
//

import Foundation
import Moya

enum NetworkService {
    case catgory
}

extension NetworkService: TargetType{
    var baseURL: URL{
        let baseUrl = "http://192.168.31.157:8888/wordpress/api/"
        return URL(string: baseUrl)!
    }
    
    var path: String{
        switch self {
        case .catgory:
            return "get_category_index"
        
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .catgory:
            return .get
    
        }
    }
    
    var parameters: [String : Any]?{
        switch self {
        case .catgory:
            return nil
     
        }
    }
    
    var parameterEncoding: ParameterEncoding{
        switch self {
        case .catgory:
            return URLEncoding.default
    
        }
    }
    
    var sampleData: Data{
        switch self {
        case .catgory:
            return "category test ok".utf8Encoded
        }
    }
    
    var task: Task{
        switch self {
        case .catgory:
            return .request
   
        }
    }
}

//Helper
private extension String{
    var urlEscaped: String{
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data{
        return self.data(using: .utf8)!
    }
}
