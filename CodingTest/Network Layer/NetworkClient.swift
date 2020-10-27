//
//  NetworkClient.swift
//  Created by mohammed on 9/6/20.
//  Copyright © 2020 mohammedErbia. All rights reserved.
//

import Foundation
import Alamofire
struct NetworkClient {
    // Define Error and Success Type
//    typealias onSuccess<T> = ((T?, _ error: Error?) -> ())
//    typealias onFailure = ( (_ error: Error) -> ())
    
    //MARK: - Ginaric Request Function
    
    static func Request<T>(_ controller  : UIViewController?,_ object: T.Type, router: APIRouter, respons: @escaping ((T?, _ error: Error? ) -> ()))
        
        where T: Decodable{
            if !Networke.Netwoke.connectedToNetwork(){
                print("NO INTRINT CONICTION")
                respons(nil,nil )
            }else{
                controller?.showHUDLoder()
                AF.request(router).responseJSON { (response) in
                    print(response.result)
                    switch response.result{
                        
                    case .success( _):
                        do {
                            let decoder = JSONDecoder()
                            let data = try decoder.decode(T.self, from: response.data!)
                            respons(data, nil )
                            controller?.hidHUD()
                        }
                        catch let jsonError{
                            controller?.dismiss(animated: true, completion: nil)
                            respons(nil,jsonError )
                            controller?.hidHUD()
                            print(jsonError)
                            print(jsonError.localizedDescription)
                            controller?.showHUD(title: jsonError.localizedDescription)
                        }
                    case .failure(let error):
                        controller?.dismiss(animated: true, completion: nil)
                        respons(nil,error )
                        controller?.hidHUD()
                        print(error)
                        print(error.localizedDescription)
                        controller?.showHUD(title: error.localizedDescription)
                    }              }
            }
    }
}
    


 
