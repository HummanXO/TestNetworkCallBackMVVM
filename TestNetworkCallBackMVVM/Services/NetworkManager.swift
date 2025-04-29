import Foundation

class NetworkManager {
    private let urlString = "https://official-joke-api.appspot.com/jokes/random"
    
    func getJoke(completion: @escaping (JokeModel) -> Void) {
        
        guard let url = URL(string: urlString) else {
            print("Invalid url")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Unsolved task \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("Error getting data")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(JokeModel.self, from: data)
                completion(json)
            } catch {
                print("Error decoding json: \(error.localizedDescription)")
            }
        }.resume()
        
    }
}
