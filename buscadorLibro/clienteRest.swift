//
//  clienteRest.swift
//  buscadorLibro
//
//  Created by Victor Ernesto Velasco Esquivel on 08/04/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import Foundation
import SystemConfiguration

class RestCliente {
    
    init() {
        
    }

    func sincrono(code : String)  -> String {
    
    let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + code
    
     
        
    //978-84-376-0494-7"
    let url = NSURL(string: urls)
    let datos :  NSData? = NSData (contentsOf : url! as URL)
    let texto = NSString(data: datos as! Data, encoding: String.Encoding.utf8.rawValue )
    
   return texto as! String
    
}
    
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    
}
