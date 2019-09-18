import Moya

typealias ErrorToVoid = (_ error: Error) -> Void

struct NetworkManager {
    // MARK: - properties
    
    static let shared = NetworkManager()
    private var provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // MARK: init
    
    private init() {}
    
    // MARK: - public
    
    func requestObject<T: TargetType, D: Decodable>(_ target: T, onSuccess success: @escaping (_ object: D?) -> Void, onFailure failure: @escaping ErrorToVoid) {

        provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let response):
                do {
                    guard response.data.isEmpty == false else {
                        success(nil)
                        return
                    }
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let object = try decoder.decode(D.self, from: response.data)
                    success(object)
                } catch let error {
                    print("decode error: ", error)
                    failure(CustomError.somethingWrong)
                }
            case .failure(let error):
                do {
                    failure(error)
                }
            }
        }
    }
}
