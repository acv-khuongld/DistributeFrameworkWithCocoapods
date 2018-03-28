//
//  ClassDemo.swift
//  FrameworkSample
//
//  Created by KHUONG_ACV on 3/22/18.
//  Copyright © 2018 KHUONG_ACV. All rights reserved.
//

import UIKit
import Alamofire

public class ClassDemo: NSObject {
    
    public func printMethod() {
        print("Called !")
    }
    
    //GET DATA
//    https://www.reddit.com/subreddits/popular/.json?limit=15
    public func getData() {

        Alamofire.request(URL.init(string: "https://www.reddit.com/subreddits/popular/.json?limit=15")!, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
        }
        
    }

}
