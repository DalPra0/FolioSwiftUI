//
//  ViewController.swift
//  Folio
//
//  Created by Lucas Dal Pra Brascher on 10/07/25.
//

import UIKit

// MARK: - ViewController
// Esta classe controla a tela principal que exibe a lista de chás.
class ViewController: UIViewController {

    // 1. Conexão com o Storyboard
    // Esta variável representa a Table View que adicionamos no Storyboard.
    // A conexão é feita arrastando do Storyboard para o código.
    @IBOutlet weak var tableView: UITableView!
    
    // 2. Fonte de Dados
    // Uma array que vai armazenar todos os nossos objetos 'Cha'.
    // Inicializamos com os dados carregados do nosso arquivo JSON.
    var chas: [Cha] = DataLoader.load("TeaData.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3. Configuração Inicial
        // Definimos que o 'ViewController' será o responsável por fornecer
        // os dados (dataSource) e lidar com as interações (delegate) da nossa tableView.
        tableView.dataSource = self
        tableView.delegate = self
        
        // Define o título que aparecerá na barra de navegação no topo.
        self.title = "Folio"
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
// A extensão abaixo organiza o código. Aqui, implementamos os protocolos
// necessários para que a Table View funcione.
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Pergunta: Quantas linhas a sua lista deve ter?
    // Resposta: O número exato de chás que temos na nossa array.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chas.count
    }
    
    // Pergunta: Como deve ser a célula para uma linha específica?
    // Resposta: Nós criamos e configuramos a célula aqui.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Pega uma célula reutilizável com o identificador que definimos no Storyboard.
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeaCell", for: indexPath)
        
        // Pega o chá correspondente a esta linha.
        let cha = chas[indexPath.row]
        
        // Configura o conteúdo da célula.
        cell.textLabel?.text = cha.nome
        cell.detailTextLabel?.text = cha.nomeCientifico
        
        // Retorna a célula pronta para ser exibida.
        return cell
    }
}

