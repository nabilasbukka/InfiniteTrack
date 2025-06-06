//
//  ApiManager.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 30/05/25.
//

import Foundation
import Alamofire
import UIKit

final class ApiManager {
    let baseUrl: String = "https://infinitetrack.infinitelearningproject.com"
    static let shared = ApiManager()
    
    func request<Response: Codable>(endpoint: String, parameters: [String: Any] = [:], method: HTTPMethod = .get) async throws -> Response {
        let url = baseUrl + endpoint
        
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
        
        var headers: HTTPHeaders = []
        
        if let token: String = UserDefaultsManager.shared.get(key: .token) {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
                .validate({ request, response, data in
                    if response.statusCode >= 400, let data {
                        do {
                            let basicResponse = try JSONDecoder().decode(BasicResponse.self, from: data)
                            return .failure(basicResponse)
                        } catch {
                            return .failure(AFError.responseSerializationFailed(reason: .decodingFailed(error: error)))
                        }
                    }
                    return .success(())
                })
                .responseDecodable(of: Response.self, queue: .global(qos: .background)) { response in
                    switch response.result {
                    case .success(let data):
                        // return decodable
                        continuation.resume(returning: data)
                    case .failure(let error):
                        // throw error
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
    func upload<Response: Codable>(endpoint: String, parameters: [String: Any] = [:], image: UIImage) async throws -> Response {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            throw URLError(.cannotDecodeContentData)
        }
        let url = baseUrl + endpoint
        
        let encoding: ParameterEncoding = URLEncoding.default
        
        var headers: HTTPHeaders = ["Content-type": "multipart/form-data"]
        
        if let token: String = UserDefaultsManager.shared.get(key: .token) {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return try await withCheckedThrowingContinuation { continuation in
//            AF.request(url, method: .post, parameters: parameters, encoding: encoding, headers: headers)
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: "upload_image", fileName: "image.jpg", mimeType: "image/jpeg")
                
                for (key, value) in parameters {
                    let stringValue = "\(value)"
                    if let data = stringValue.data(using: .utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                }
            }, to: url, headers: headers)
                .validate({ request, response, data in
                    if response.statusCode >= 400, let data {
                        do {
                            let basicResponse = try JSONDecoder().decode(BasicResponse.self, from: data)
                            return .failure(basicResponse)
                        } catch {
                            return .failure(AFError.responseSerializationFailed(reason: .decodingFailed(error: error)))
                        }
                    }
                    return .success(())
                })
                .responseDecodable(of: Response.self, queue: .global(qos: .background)) { response in
                    switch response.result {
                    case .success(let data):
                        // return decodable
                        continuation.resume(returning: data)
                    case .failure(let error):
                        // throw error
                        continuation.resume(throwing: error)
                    }
                }
        }
    }

}

struct UserResponse: Codable {
    let name: String?
    let divisionId: String?
    let division: String?
    let headprogram: String?
}


