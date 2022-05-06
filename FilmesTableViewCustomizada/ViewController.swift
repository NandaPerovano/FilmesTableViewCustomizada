//
//  ViewController.swift
//  FilmesTableViewCustomizada
//
//  Created by Fernanda Perovano Ribeiro Montes on 04/05/22.
//  Copyright © 2022 teste. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var filmesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmesTableView.dataSource = self
        filmesTableView.delegate = self
    }
    
    struct Filmes {
        let nome: String
        let imagem: String
    }
    
    let colecaoFilmes: [Filmes] = [
        Filmes(nome: "A Corrente do Bem", imagem: "aCorrenteDoBem"),
        Filmes(nome: "O Sexto Sentido", imagem: "oSextoSentido"),
        Filmes(nome: "Tempo de Matar", imagem: "tempoDeMatar"),
        Filmes(nome: "Um Contratempo", imagem: "umContratempo"),
        Filmes(nome: "Um Sonho de Liberdade", imagem: "umSonhoDeLiberdade")
    ]
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colecaoFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = filmesTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! FilmesTableViewCell
        let listaDeFilmes = colecaoFilmes[indexPath.row]
        cell.nomeFilme?.text = listaDeFilmes.nome
        cell.imagemFilme?.image = UIImage(named: listaDeFilmes.imagem)
        cell.imagemFilme.layer.cornerRadius = 42
        cell.imagemFilme.clipsToBounds = true

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Você selecionou o filme \(colecaoFilmes[indexPath.row].nome)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
