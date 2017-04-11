//
//  BuscadorViewController.swift
//  buscadorLibro
//
//  Created by Victor Ernesto Velasco Esquivel on 07/04/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import UIKit

class BuscadorViewController: UIViewController {

    
    @IBOutlet weak var txtISBN: UITextField!
    @IBOutlet weak var txtResult: UITextView!
    @IBOutlet weak var btnBuscar: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cambioTexto(_ sender: Any) {
       let tamanio = txtISBN.text?.characters.count
        if(tamanio == 0){
            btnBuscar.isHidden = true
        }
        else{
            btnBuscar.isHidden = false
        }
    }
    
    
    @IBAction func limpiaISBN(_ sender: Any) {
        txtISBN.text = ""
        txtResult.text = ""
        btnBuscar.isHidden = true
    }
    
    
    
    
    @IBAction func buscar(_ sender: Any) {
        buscarLibro()
    }
    
    
    @IBAction func buscarTeclado(_ sender: Any) {
        buscarLibro()
        
    }
    
    func buscarLibro(){
        let cli = RestCliente()
        var response : String = ""
        if (cli.isInternetAvailable())
        {
            response = cli.sincrono(code: txtISBN.text!)
            
        }
        else{
            
            response = "Verifique su conexión de red"
            alerta(mensaje: response, titulo: "Alerta")
        }
        
        
        
        txtResult.text = response
    }
    
    
    func alerta(mensaje : String, titulo: String){
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
