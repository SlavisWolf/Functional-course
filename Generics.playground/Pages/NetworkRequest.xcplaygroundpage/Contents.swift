import UIKit


struct Employee: Decodable {
    
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let gender: String
    let email: String
    let department: String
    let avatar: String
    let zipcode: String?
}

//Only work for images
func getImageFromNetwork(url: URL, builder: @escaping (Data) -> (UIImage?), callback: @escaping (UIImage) -> () ) {
    
    URLSession(configuration: .default).dataTask(with: URLRequest(url: url) ) { data, response, error in
        
        guard let data, let response = response as? HTTPURLResponse, error == nil else {
            if let error { print(error.localizedDescription) }
            return
        }
        
        guard response.statusCode == 200 else {
            print("Error the status code is \(response.statusCode)")
            return
        }
        
        if let builded = builder(data) { callback(builded) }
        
    }.resume()
}

let imageUrl = URL(string: "https://www.aquariadise.com/wp-content/uploads/2022/07/Betta-fish.webp")!

getImageFromNetwork(url: imageUrl) {
    UIImage(data: $0)
} callback: {
    print($0)
    $0
}

// Now with generics!!
func getNetwork<T>(url: URL, builder: @escaping (Data) -> (T?), callback: @escaping (T) -> () ) {
    
    URLSession(configuration: .default).dataTask(with: URLRequest(url: url) ) { data, response, error in
        
        guard let data, let response = response as? HTTPURLResponse, error == nil else {
            if let error { print(error.localizedDescription) }
            return
        }
        
        guard response.statusCode == 200 else {
            print("Error the status code is \(response.statusCode)")
            return
        }
        
        if let builded = builder(data) { callback(builded) }
        
    }.resume()
}


getNetwork(url: imageUrl) {
    UIImage(data: $0)
} callback: {
    print($0)
    $0
}


getNetwork(url: URL(string: "I don't have any url with this data ;( this will crash")!) {
    try? JSONDecoder().decode([Employee].self, from: $0)
} callback: {
    print($0)
}

