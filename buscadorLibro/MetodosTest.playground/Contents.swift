//: Playground - noun: a place where people can play

import UIKit

var H : String = "HOLA"



func sincrono(){
    let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:978-84-376-0494-7"
    let url = NSURL(string: urls)
    let datos :  NSData? = NSData (contentsOf : url! as URL) //NSData(contentsOf : url! as URL)
    let texto = NSString(data: datos as! Data, encoding: String.Encoding.utf8.rawValue )
    
    print(texto!)
    
    
}



sincrono()