// https://kor45cw.tistory.com/295

import Foundation

let baseURL = "https://jsonplaceholder.typicode.com"

enum HttpMethod<Body> {
    case get
    case post(Body)
    case put(Body)
    case patch(Body)
    case delete(Body)
}

extension HttpMethod {
    var method: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .patch: return "PATCH"
        case .delete: return "DELETE"
        }
    }
}

struct UserData: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct Resource<T> {
    var urlRequest: URLRequest
    let parse: (Data) -> T?
}

extension Resource where T: Decodable {
    init(url: URL) {
        self.urlRequest = URLRequest(url: url)
        self.parse = { data in try? JSONDecoder().decode(T.self, from: data) }
    }
    
    init(url: String, parameters _parameters: [String: String]) {
        var component = URLComponents(string: url)
        var parameters = [URLQueryItem]()
        for (name, value) in _parameters {
            if name.isEmpty { continue }
            parameters.append(URLQueryItem(name: name, value: value))
        }
        
        if !parameters.isEmpty {
            component?.queryItems = parameters
        }
        if let componentURL = component?.url {
            self.urlRequest = URLRequest(url: componentURL)
        } else {
            self.urlRequest = URLRequest(url: URL(string: url)!)
        }
        self.parse =  { data in try? JSONDecoder().decode(T.self, from: data) }
    }
    
    init<Body: Encodable>(url: URL, method: HttpMethod<Body>) {
        self.urlRequest = URLRequest(url: url)
        self.urlRequest.httpMethod = method.method
        
        switch  method {
        case .post(let body), .put(let body), .patch(let body), .delete(let body):
            self.urlRequest.httpBody = try? JSONEncoder().encode(body)
            self.urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            self.urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        default:
            break
        }
        
        self.parse = { data in try? JSONDecoder().decode(T.self, from: data) }
    }
}

extension URLSession {
    func load<T>(_ resource: Resource<T>, completion: @escaping (T?, Bool) -> Void) {
        dataTask(with: resource.urlRequest) { data, response, error in
            if let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) {
                completion(data.flatMap(resource.parse), true)
            } else {
                completion(nil, false)
            }
        }.resume()
    }
}

class API {
    enum APIError: LocalizedError {
        case urlNotSupport
        case noData
    
        var errorDescription: String? {
            switch self {
            case .urlNotSupport: return "URL NOT Supported"
            case .noData: return "Has No Data"
            }
        }
    }
    
    static let shared: API = API()
    
    private lazy var defaultSession = URLSession(configuration: .default)
    
    private init() {}
    
    func get1(completionHandler: @escaping (Result<[UserData], APIError>) -> Void) {
        guard let url = URL(string: "\(baseURL)/posts") else {
            completionHandler(.failure(.urlNotSupport))
            return
        }
        let resource = Resource<[UserData]>(url: url)
        defaultSession.load(resource) { userData, _ in
            guard let data = userData, !data.isEmpty else {
                completionHandler(.failure(.noData))
                return
            }
            completionHandler(.success(data))
        }
    }
    
    func get2(completionHandler: @escaping (Result<[UserData], APIError>) -> Void) {
        let resource = Resource<[UserData]>(url: "\(baseURL)/posts", parameters: ["userId": "2"])
        defaultSession.load(resource) { userData, _ in
            guard let data = userData, !data.isEmpty else {
                completionHandler(.failure(.noData))
                return
            }
            completionHandler(.success(data))
        }
    }
    
}

API.shared.get1 { result in
    switch result {
    case .success(let userData):
        guard let data = userData.first else { return }
        print(data)
    case .failure(let error):
        print("Error : \(error.localizedDescription)")
    }
}

API.shared.get2 { result in
    switch result {
    case .success(let userData):
        guard let data = userData.first else { return }
        print(data)
    case .failure(let error):
        print("Error : \(error.localizedDescription)")
    }
}

