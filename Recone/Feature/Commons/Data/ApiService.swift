//
//  HomeAPIService.swift
//  Recone
//
//  Created by Maria Clara Lopes on 26/05/21.
//

import Foundation
import Alamofire

enum EndPoints: String {
    case usersFavorites = "/user/favorites"
    case users = "/user"
    case login = "/login"
    case id = "/user/"
    case occupation = "/user?occupation="
}

struct ApiService {
    private static let baseUrl = "https://camp-recon-api.herokuapp.com"
    
    private static func makeUrl(endPoint: EndPoints, filter: String = "") -> String {
        return baseUrl + endPoint.rawValue + filter
    }
    
    static func getUsers(endPoint: EndPoints, completionHandler: @escaping (Result<[UsersResponse], Error>) -> Void) {
        let url = makeUrl(endPoint: endPoint)
        
        AF.request(url, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case.success(_):
                    do {
                        let jsonData = response.data
                        let userArray = try JSONDecoder().decode([UsersResponse].self, from: jsonData!)
                        completionHandler(.success(userArray))
                    } catch  {
                        completionHandler(.failure(error))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
    
    static func getUsers(by id: String, endPoint: EndPoints, completionHandler: @escaping (Result<UserResponse, Error>) -> Void) {
        let url = makeUrl(endPoint: endPoint, filter: id)
        print(url)
        
        AF.request(url, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case.success(_):
                    do {
                        let jsonData = response.data
                        let user = try JSONDecoder().decode(UserResponse.self, from: jsonData!)
                        completionHandler(.success(user))
                    } catch  {
                        completionHandler(.failure(error))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
    
    static func getUsers(occupation: String, endPoint: EndPoints, completionHandler: @escaping (Result<[UsersResponse], Error>) -> Void) {
        let url = makeUrl(endPoint: endPoint, filter: occupation)
        print(url)
        
        AF.request(url, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case.success(_):
                    do {
                        let jsonData = response.data
                        let user = try JSONDecoder().decode([UsersResponse].self, from: jsonData!)
                        completionHandler(.success(user))
                    } catch  {
                        completionHandler(.failure(error))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
    
    static func postSignIn(email: String, password: String, completionHandler: @escaping (Result<UsersResponse, Error>) -> Void) {
        let url = makeUrl(endPoint: EndPoints.login)
        let parameters: Parameters = [ "email": email, "password": password]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case.success:
                    do {
                        let jsonData = response.data
                        let user = try JSONDecoder().decode(UsersResponse.self, from: jsonData!)
                        completionHandler(.success(user))
                    } catch  {
                        completionHandler(.failure(error))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
}


//        AF.request(url, method: .get)
//            .validate()
//            .responseDecodable(of: [UsersResponse].self) { response in
//                switch response.result {
//                case .success(let users):
//                    completionHandler(.success(users))
//                case .failure(let error):
//                    completionHandler(.failure(error))
//                }
//            }
