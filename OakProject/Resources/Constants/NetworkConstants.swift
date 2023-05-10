//
//  NetworkConstants.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import Foundation

struct NetworkConstants {
    
    let baseUrl = "https://m104e.wiremockapi.cloud/v1"
    let headerValue = "f5e0861a-b53d-4b80-9c28-2233780c3d5d"
    enum Pages : String{
        case flashLight = "/flashlights"
        case colorLight = "/colorlights"
        case sosAlert = "/sosalerts"
    }
    
    enum HTTPMethods : String{
        case GET = "GET"
    }
}

struct RequestError {
    
    enum ErrorTypes : String {
        case NetworkError = "Network Error. Please Try Again"
        case SomethingWentWrong = "Something went wrong. Please Try Again."
    }
    
}
