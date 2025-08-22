//
//  GeocodingClient.swift
//  WeatherApp
//
//  Created by Isha Nailwal on 16/03/25.
//

import Foundation

enum Networkerror: Error {
    case invalidResponse
}

struct GeocodingClient {
    
    func coordinateByCity(_ city: String) async throws -> Location? {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .coordinatesByLocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw Networkerror.invalidResponse
        }
        
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations.first
    }
}
