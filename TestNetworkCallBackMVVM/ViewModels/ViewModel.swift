import Foundation

class ViewModel {
    
    var joke: String = "" {
        didSet {
            onDataUpdated?(joke)
        }
    }
    
    var networkManager = NetworkManager()
    var onDataUpdated: ((String) -> Void)?
    
    func getJoke() {
        networkManager.getJoke { [weak self] result in
            self?.joke += result.setup
            self?.joke += "\n"
            self?.joke += result.punchline
        }
    }
    
}
