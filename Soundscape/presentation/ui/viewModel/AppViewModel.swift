//
//  MusicPlayerViewModel.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation
import Firebase
import AVKit
import MediaPlayer

@MainActor
final class AppViewModel: ObservableObject {
    // MARK: Audio player variables
    @Published var showBottomPlayer: Bool = false
    @Published var episode: Episode = EpisodeData.sampleEpisodeData
    @Published var episodeList: [Episode] = []
    @Published var isShuffle: Bool = false
    @Published var currentIndex: Int = 0
    @Published var musicPlayerTitle = ""
    @Published var expand: Bool = false
    @Published var audioPlayer: AVPlayer?
    private let audioSession = AVAudioSession.sharedInstance()
    @Published var isPlaying: Bool = false
    @Published var isLoading: Bool = false
    @Published var currentTime: Double = 0.0
    @Published var totalTime: Double = 0.0
    @Published var isRepeatSingle = false
    var timeObserverToken: Any?

    // MARK: Effect player
    @Published var effectPlayer1: AVPlayer?
    @Published var effectPlayer2: AVPlayer?
    @Published var effectPlayingList: [AudioFetch] = []
    @Published var effectVol1: Float = 0.5
    @Published var effectVol2: Float = 0.5
    
    // MARK: Timer variables
    @Published var remainingSeconds = 0
    @Published var timerDuration = ""
    @Published var PlayBackSpeed : Float = 1.0
    private var timer: Timer?
    
    // MARK: Db and api variables
    @Published var selectedAudioFetch: AudioFetch?
    @Published var audioFetchList: [AudioFetch] = []
    @Published var audioFetchListSongDb: [AudioFetch] = []
    @Published var audioFetchListStoryDb: [AudioFetch] = []
    @Published var alertItem: AlertItem?
    @Published var isLiked: Bool = false
    @Published var storyFetchListDb: [AudioFetch] = []
    @Published var likedSongs: [Int64: Bool] = [:]
    
    // MARK: login variables
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isUserDataSaved: Bool = false
    @Published var userName: String? = ""
    
    // MARK: Usecase
    private let getSongFetchUseCase = GetSongFetchUseCase.shared
    private let getAllSongFetchUseCase = GetAllSongFetchUseCase.shared
    private let saveSongUseCase = SaveSongUseCase.shared
    private let getSaveSongUseCase = GetSavedSongUseCase.shared
    private let saveStoryUseCase = SaveStoryUseCase.shared
    private let deleteDatabaseUseCase = DeleteDatabaseUseCase.shared
    private let deleteSongUseCase = DeleteSongUseCase.shared
    private let getSavedStoryUseCase = GetSavedStoryUseCase.shared
    private let deleteStoryUseCase = DeleteStoryUseCase.shared
    
    // MARK: Auth Usecase
    private let googleLoginUseCase = GoogleLoginUseCase.shared
    private let loginEmailUseCase = LoginEmailUseCase.shared
    private let fetchUserUseCase = FetchUserUseCase.shared
    private let createUserUseCase = CreateUserUseCase.shared
    private let signOutUseCase = SignOutUseCase.shared
    private let saveUserUseCase = SaveUserUseCase.shared
    private let forgotUseCase = ForgoutPasswordUseCase.shared
    private let deleteAccountUseCase = DeleteAccountUseCase.shared
    
    // MARK: Apple signIn
    @Published var didSignInApple: Bool = false
    let signInHelper = SignInAppleHelper()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.userName = UserDefaults.standard.string(forKey: "userName")
    }
    
    // MARK: API functions
    func getAllSong() async {
        isLoading = true
        do {
            audioFetchList = try await getAllSongFetchUseCase.execute()
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
    
    // MARK: Song DB functions
    func getAllSongFromDb() async {
        isLoading = true
        do {
            audioFetchListSongDb = try await getSaveSongUseCase.execute()
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
    
    func checkSongInDbList(id: Int64) -> Bool {
        // MARK: Assuming audioFetchListDb and audioFetchList are arrays of some type
        let audioFetchListDbDict = Dictionary(uniqueKeysWithValues: audioFetchListSongDb.map { ($0.id, $0) })
        
        if audioFetchListDbDict[id] != nil {
            return true
        } else {
            return false
        }
    }
    
    // MARK: Story Db functions
    func getAllStoryFromDb() async {
        isLoading = true
        do {
            audioFetchListStoryDb = try await getSavedStoryUseCase.execute()
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
    
    func checkStoryInDbList(id: Int64) -> Bool {
        // MARK: Assuming audioFetchListDb and audioFetchList are arrays of some type
        let audioFetchListDbDict = Dictionary(uniqueKeysWithValues: audioFetchListStoryDb.map { ($0.id, $0) })
        
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
    
    func deleteSong(audioFetch: AudioFetch) async {
            do {
                try await deleteSongUseCase.execute(audioFetch: audioFetch)
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
    
    // MARK: Story DB functions
    func saveStory(audioFetch: AudioFetch) async {
        do {
            try await saveStoryUseCase.execute(audioFetch: audioFetch)
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
    
    func deleteStory(audioFetch: AudioFetch) async {
        do {
            try await deleteStoryUseCase.execute(audioFetch: audioFetch)
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
    
    // MARK: Common Db functions
    func deleteDatabase() async {
        do {
            try await deleteDatabaseUseCase.execute()
        } catch {
            print("DEBUG: Delete db \(error.localizedDescription)")
        }
    }
    
    // MARK: Audio player functions
    func playSound(sound: String) {
        guard let url = URL(string: sound) else { return }
        do {
            // Show loader
            isLoading = true
            
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
            let playerItem = AVPlayerItem(url: url)
            audioPlayer = AVPlayer(playerItem: playerItem)
            
            // Calculate total time
            let asset = AVURLAsset(url: url)
            let duration = asset.duration
            totalTime = duration.seconds
            
            // Reset seek
            currentTime = 0.0
            
            // Setup data to mediaPlayer
            setupNowPlaying()
            
            audioPlayer?.addPeriodicTimeObserver(forInterval: .init(seconds: 1, preferredTimescale: 1), queue: .main) { [weak self] time in
                guard let self = self else { return }
                
                // Ensure we're on the main actor before accessing audioPlayer
                Task {
                    await MainActor.run {
                        guard let player = self.audioPlayer, player.currentItem?.status == .readyToPlay else {
                            return
                        }
                        self.currentTime = player.currentTime().seconds
                        self.setupNowPlaying()
                        
                        if abs(self.currentTime - self.totalTime) < 0.1 && !self.episodeList.isEmpty && self.currentIndex != (self.episodeList.count - 1) && !self.isRepeatSingle {
                            
                            print("hello")
                            self.playNextSound()
                        }
                        
                        if abs(self.currentTime - self.totalTime) < 0.1 && !self.episodeList.isEmpty && self.currentIndex == (self.episodeList.count - 1) {
                            self.pauseSound()
                        }
                        
                        if abs(self.currentTime - self.totalTime) < 0.1 && self.isRepeatSingle {
                            self.seek(to: 0)
                            self.playSound()
                        }
                    }
                }
            }
            
            // Play song
            playSound()
            
            // Hide loader
            isLoading = false
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func playSound() {
        updateNowPlaying(isPause: false)
        audioPlayer?.play()
        isPlaying = true
        playEffect1()
        playEffect2()
    }
    
    func pauseSound() {
        updateNowPlaying(isPause: true)
        audioPlayer?.pause()
        isPlaying = false
        pauseEffect1()
        pauseEffect2()
    }
    
    func playNextSound() {
        // Increment the index to move to the next episode
        currentIndex = (currentIndex + 1) % episodeList.count
        // Get the next episode from the list
        let nextEpisode = episodeList[currentIndex]
        
        // Update the episode and play the sound
        episode = nextEpisode
        print("heloo")
        playSound(sound: episode.songPath)
    }
    
    func playPreviousSound() {
        // Decrement the index to move to the next episode
        if currentIndex != 0 {
            currentIndex = (currentIndex - 1) % episodeList.count
        }
        // Get the next episode from the list
        let nextEpisode = episodeList[currentIndex]
        
        // Update the episode and play the sound
        episode = nextEpisode
        playSound(sound: episode.songPath)
    }
    
    func seek(to time: Double) {
        let cmTime = CMTime(seconds: time, preferredTimescale: 1)
        audioPlayer?.seek(to: cmTime)
        var nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo!
        
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = currentTime

        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()

        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            
            if !isPlaying {
                playSound()
                return .success
            }
            return .commandFailed
        }

        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if isPlaying {
                pauseSound()
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Next Command
        commandCenter.nextTrackCommand.addTarget { [unowned self] event in
            playNextSound()
            return .success
        }
        
        // Add handler for Previous Command
        commandCenter.previousTrackCommand.addTarget { [unowned self] event in
            playPreviousSound()
            return .success
        }
        
        // Add handler for Change Playback Position Command (Seeking)
        commandCenter.changePlaybackPositionCommand.addTarget { [unowned self] event in
            guard let event = event as? MPChangePlaybackPositionCommandEvent else {
                return .commandFailed
            }
            let timeInSeconds = event.positionTime
            seek(to: timeInSeconds)
            return .success
        }
    }
    
    func setupNowPlaying() {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = episode.songName

        
        if let image = UIImage(named: episode.imageName) {
            nowPlayingInfo[MPMediaItemPropertyArtwork] =
                MPMediaItemArtwork(boundsSize: image.size) { size in
                    // Extension used here to return newly sized image
                    return image.imageWith(newSize: size)
            }
        }
        
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = currentTime
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = totalTime
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = audioPlayer?.rate

        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    func updateNowPlaying(isPause: Bool) {
        // Define Now Playing Info
        var nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo!

        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = currentTime
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = isPause ? 0 : 1

        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    // MARK: Effect players
    func playEffect1(sound: String) {
        guard let url = URL(string: sound) else { return }
        do {
            // Show loader
            isLoading = true
            
            let playerItem = AVPlayerItem(url: url)
            effectPlayer1 = AVPlayer(playerItem: playerItem)
            effectPlayer1?.volume = effectVol1
            
            // Play song
            playEffect1()
            
            // Hide loader
            isLoading = false
        } 
      
    }
    
    func playEffect1() {
        effectPlayer1?.play()
    }
    
    func pauseEffect1() {
        effectPlayer1?.pause()
    }
    
    func playEffect2(sound: String) {
        guard let url = URL(string: sound) else { return }
        do {
            // Show loader
            isLoading = true
            
            let playerItem = AVPlayerItem(url: url)
            effectPlayer2 = AVPlayer(playerItem: playerItem)
            effectPlayer2?.volume = effectVol2
            
            // Play song
            playEffect2()
            
            // Hide loader
            isLoading = false
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func playEffect2() {
        effectPlayer2?.play()
    }
    
    func pauseEffect2() {
        effectPlayer2?.pause()
    }
    
    // MARK: Timer functions
    func startTimer() {
        // Cancel the previous timer if it exists
        timer?.invalidate()
        
        remainingSeconds = secondsForTimer(timerDuration)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            DispatchQueue.main.async { // Dispatch to main thread
                if self.remainingSeconds > 0 {
                    self.remainingSeconds -= 1
                } else {
                    self.timer?.invalidate()
                    self.timer = nil
                    self.pauseSound()
                }
            }
        }
    }
     func PlayBackSpeedSetted() {
        // Cancel the previous timer if it exists
         print("sjcckdomdoc---> " + String(PlayBackSpeed))
         self.audioPlayer?.rate=PlayBackSpeed
    }
    
    func secondsForTimer(_ timerDuration: String) -> Int {
        switch timerDuration {
            
        case "6 Min": return 6 * 60
        case "5 Min": return 5 * 60
        case "4 Min": return 4 * 60
        case "3 Min": return 3 * 60
        case "2 Min": return 2 * 60
        case "1 Min": return 60
            
//        case "60 Min": return 60 * 60
//        case "50 Min": return 50 * 60
//        case "40 Min": return 40 * 60
//        case "30 Min": return 30 * 60
//        case "20 Min": return 20 * 60
//        case "10 Min": return 10 * 60
        default: return 0
        }
    }
    
    // MARK: Login functions
    func signIn(withEmail email: String, password: String) async throws {
        do {
            userSession = try await loginEmailUseCase.execute(withEmail: email, password: password)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                        alertItem = AlertContext.noInternetConnection
            } else if let firError = error as? AuthError {
                switch firError {
                case .invalidEmailError:
                    alertItem = AlertContext.invalidEmail
                case .wrongPasswordError:
                    alertItem = AlertContext.wrongPasswordError
                default:
                    alertItem = AlertContext.loginError
                }
            }
        }
    }
    
    func signInGoogle() async throws {
        do {
            userSession = try await googleLoginUseCase.execute()
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                        alertItem = AlertContext.noInternetConnection
            } else if let firError = error as? AuthError {
                switch firError {
                case .invalidEmailError:
                    alertItem = AlertContext.invalidEmail
                default:
                    alertItem = AlertContext.loginError
                }
            }
        }
    }
    
    func signInApple() async throws {
        signInHelper.startSignInWithAppleFlow { result in
            switch result {
            case .success(let signInAppleResult):
                Task {
                    do {
                        self.userSession = try await self.signInWithApple(tokens: signInAppleResult)
                        self.didSignInApple = true
                    } catch {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func signInWithApple(tokens: SignInWithAppleResult) async throws -> Firebase.User? {
        let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokens.token, rawNonce: tokens.nonce)
        let result = try await Auth.auth().signIn(with: credential)
        return result.user
    }
    
    func createUserAccount(withEmail email: String, password: String) async throws {
        do {
            userSession = try await createUserUseCase.execute(withEmail: email, password: password)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                        alertItem = AlertContext.noInternetConnection
            } else if let firError = error as? AuthError {
                switch firError {
                case .invalidEmailError:
                    alertItem = AlertContext.invalidEmail
                case .userExistError:
                    alertItem = AlertContext.userExistError
                default:
                    alertItem = AlertContext.loginError
                }
            }
        }
    }
    
    func fetchUserAccount() async throws {
        do {
            currentUser = try await fetchUserUseCase.execute()
            UserDefaults.standard.set(currentUser?.nickname, forKey: "userName")
            userName = currentUser?.nickname
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
            userName = nil
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
    
    func forgotPassword(withEmail email: String) async throws {
        do {
            _ = try await forgotUseCase.execute(withEmail: email)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
}
