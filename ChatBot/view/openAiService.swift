//
//  openAiService.swift
//  ChatBot
//
//  Created by Dwayne on 22/2/2023.
//

import Foundation
import Alamofire
import Combine

class OpenAiService {
    let baseUrl = "https://api.openai.com/v1/completions"
    
    func sendMessage(message: String) -> AnyPublisher<openAiCompletionsResponse, Error> {
        let body = openAiCompletionsBody(model: "text-davinci-003", promt: message, temperature: 0.8)
        let headers: HTTPHeaders = [
            "Auithorization" : "Bearer \(Constants.openAIAPIKey)"
        ]
        return Future { [weak self] promise in
            guard let self = self else { return }
        
        AF.request(self.baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of: openAiCompletionsResponse.self) { response in
            switch response.result {
            case .success(let result):
                promise(.success(result))
            case .failure(let error):
                promise(.failure(error))
            }
        }
    }
        .eraseToAnyPublisher()
}

struct openAiCompletionsBody: Encodable {
    let model: String
    let promt: String
    let temperature: Float?
}

struct openAiCompletionsResponse: Decodable {
    let id: String
    let choice: [openAiCompletionsChoice]
}

struct openAiCompletionsChoice: Decodable {
    let text: String
}
