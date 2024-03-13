//
//  SongRepositoryImpl.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

final class SongRepositoryImpl: SongRepository {
    static let shared = SongRepositoryImpl()
    
    let songRemoteDataSource: SongRemoteDataSource
    
    init(songRemoteDataSource: SongRemoteDataSource = SongRemoteDataSourceImpl.shared) {
        self.songRemoteDataSource = songRemoteDataSource
    }
    
    private func responseToResource(response: Result<[AudioFetch], Error>) -> Resource<[AudioFetch]> {
         switch response {
         case .success(let data):
             return .success(data)
         case .failure(let error):
             return .error(error.localizedDescription, nil)
         }
     }
     
     func getSongSection(songSection: String) async -> Resource<[AudioFetch]> {
         do {
             let fetchedData = try await songRemoteDataSource.getSongSection(songSection: songSection)
             return responseToResource(response: .success(fetchedData))
         } catch {
             return responseToResource(response: .failure(error))
         }
     }
}
