//
//  ApiManager.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 30/05/25.
//

import Foundation
import Alamofire

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

}

struct UserResponse: Codable {
    let name: String?
    let divisionId: String?
    let division: String?
    let headprogram: String?
}


