//
//  MusicPlayerViewModel.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation
import AVFoundation
import Firebase

@MainActor
final class AppViewModel: ObservableObject {
    // MARK: Audio player variables
    @Published var showBottomPlayer: Bool = false
    @Published var episode: Episode = EpisodeData.sampleEpisodeData
    @Published var expand: Bool = false
    @Published var audioPlayer: AVPlayer?
    @Published var isPlaying: Bool = false
    @Published var isLoading: Bool = false
    @Published var currentTime: Double = 0.0
    @Published var totalTime: Double = 0.0
    
    // MARK: Db and api variables
    @Published var selectedAudioFetch: AudioFetch?
    @Published var audioFetchList: [AudioFetch] = []
    @Published var audioFetchListDb: [AudioFetch] = []
    @Published var alertItem: AlertItem?
    @Published var isLiked = [String : Int]()
    
    // MARK: login variables
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isUserDataSaved: Bool = false
    
    // MARK: Usecase
    private let getSongFetchUseCase = GetSongFetchUseCase.shared
    private let saveSongUseCase = SaveSongUseCase.shared
    private let getSaveSongUseCase = GetSavedSongUseCase.shared
    
    // MARK: Auth Usecase
    private let googleLoginUseCase = GoogleLoginUseCase.shared
    private let loginEmailUseCase = LoginEmailUseCase.shared
    private let fetchUserUseCase = FetchUserUseCase.shared
    private let createUserUseCase = CreateUserUseCase.shared
    private let signOutUseCase = SignOutUseCase.shared
    private let saveUserUseCase = SaveUserUseCase.shared
    private let forgotUseCase = ForgoutPasswordUseCase.shared
    private let deleteAccountUseCase = DeleteAccountUseCase.shared
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    // MARK: API functions
    func getSongSection(songSection: String) async {
        isLoading = true
        do {
            audioFetchList = try await getSongFetchUseCase.execute(songSection: songSection)
            isLoading = false
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            } else if let scError = error as? APIError {
                switch scError {
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidData:
                    alertItem = AlertContext.invalidData
                }
            }
            isLoading = false
        }
    }
    
    // MARK: DB functions
    func getAllSongFromDb() async {
        isLoading = true
        do {
            audioFetchListDb = try await getSaveSongUseCase.execute()
            isLoading = false
        } catch {
            if let dbError = error as? DBError {
                switch dbError {
                case .dataSourceError:
                    alertItem = AlertContext.dataSourceError
                case .createError:
                    alertItem = AlertContext.createError
                case .deleteError:
                    alertItem = AlertContext.deleteError
                case .updateError:
                    alertItem = AlertContext.updateError
                case .fetchError:
                    alertItem = AlertContext.fetchError
                }
            }
            isLoading = false
        }
    }
    
    func checkItemInDbList(id: Int64) -> Bool {
        // MARK: Assuming audioFetchListDb and audioFetchList are arrays of some type
        let audioFetchListDbDict = Dictionary(uniqueKeysWithValues: audioFetchListDb.map { ($0.id, $0) })
        
        if audioFetchListDbDict[id] != nil {
            return true
        } else {
            return false
        }
    }
    
    func saveSong(audioFetch: AudioFetch) async {
        do {
            try await saveSongUseCase.execute(audioFetch: audioFetch)
        } catch {
            if let dbError = error as? DBError {
                switch dbError {
                case .dataSourceError:
                    alertItem = AlertContext.dataSourceError
                case .createError:
                    alertItem = AlertContext.createError
                case .deleteError:
                    alertItem = AlertContext.deleteError
                case .updateError:
                    alertItem = AlertContext.updateError
                case .fetchError:
                    alertItem = AlertContext.fetchError
                }
            }
            
        }
    }
    
    // MARK: Audio player functions
    func playSound(sound: String) {
        guard let url = URL(string: sound) else { return }
        
        let playerItem = AVPlayerItem(url: url)
        audioPlayer = AVPlayer(playerItem: playerItem)
        
        // Show loader
        isLoading = true
        
        // Calculate total time
        let asset = AVURLAsset(url: url)
        let duration = asset.duration
        totalTime = duration.seconds
        
        // Reset seek
        currentTime = 0.0
        
        // Hide loader
        isLoading = false
    }
    
    func playSound() {
        audioPlayer?.play()
        isPlaying = true
    }
    
    func pauseSound() {
        audioPlayer?.pause()
        isPlaying = false
    }
    
    func seek(to time: Double) {
        let cmTime = CMTime(seconds: time, preferredTimescale: 1)
        audioPlayer?.seek(to: cmTime)
    }
    
    // MARK: Login functions
    func signIn(withEmail email: String, password: String) async throws {
        do {
            userSession = try await loginEmailUseCase.execute(withEmail: email, password: password)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
    
    func signInGoogle() async throws {
        do {
            userSession = try await googleLoginUseCase.execute()
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
    
    func createUserAccount(withEmail email: String, password: String) async throws {
        do {
            userSession = try await createUserUseCase.execute(withEmail: email, password: password)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
    
    func fetchUserAccount() async throws {
        do {
            currentUser = try await fetchUserUseCase.execute()
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
    
    func saveUserAccount(user: User) async throws {
        do {
            isUserDataSaved = try await saveUserUseCase.execute(user: user)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
    
    func signOut() {
        let resultBool = signOutUseCase.execute()
        if resultBool {
            userSession = nil
            currentUser = nil
        }
    }
    
    func deleteAccount() async throws {
        do {
            guard let user = userSession else {
                throw URLError(.cannotFindHost)
            }
            let resultBool = try await deleteAccountUseCase.execute(userSession: user)
            if resultBool {
                signOut()
            }
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
    
    func forgoutPassword(withEmail email: String) async throws {
        do {
            let resultBool = try await forgotUseCase.execute(withEmail: email)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
}
