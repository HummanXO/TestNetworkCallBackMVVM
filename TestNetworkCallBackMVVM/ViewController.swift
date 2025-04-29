import UIKit

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    private let jokeLabel = UILabel()
    private let getJokeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        
        jokeLabel.textColor = .black
        jokeLabel.font = .systemFont(ofSize: 15, weight: .medium)
        jokeLabel.numberOfLines = 0
        jokeLabel.textAlignment = .center
        jokeLabel.text = "Do you want a joke?"
        
        getJokeButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        getJokeButton.backgroundColor = .systemBlue
        getJokeButton.setTitleColor(.black, for: .normal)
        getJokeButton.setTitle("Get Joke", for: .normal)
        getJokeButton.layer.cornerRadius = 8
        getJokeButton.addTarget(self, action: #selector(getJokeButtonTapped), for: .touchUpInside)
        
        [jokeLabel, getJokeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            jokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            jokeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jokeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            getJokeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getJokeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getJokeButton.heightAnchor.constraint(equalToConstant: 50),
            getJokeButton.widthAnchor.constraint(equalToConstant: 150),
            
        ])
        
    }
    
    private func bindViewModel() {
        viewModel.onDataUpdated = { result in
            DispatchQueue.main.async { [weak self] in
                self?.jokeLabel.text = ""
                self?.jokeLabel.text = result
            }
        }
    }
    
    @objc private func getJokeButtonTapped() {
        viewModel.getJoke()
    }
    
}

