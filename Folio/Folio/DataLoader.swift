//
//  DataLoader.swift
//  Folio
//
//  Created by Lucas Dal Pra Brascher on 10/07/25.
//

import Foundation

// MARK: - DataLoader
// Esta classe é responsável por carregar e decodificar dados de um arquivo JSON local.
// A função 'load' é genérica, o que significa que pode carregar qualquer tipo de dado
// que se conforme ao protocolo 'Decodable' a partir de qualquer arquivo JSON.

public class DataLoader {
    
    // Esta função estática lê um arquivo do nosso projeto (bundle),
    // carrega os dados e os decodifica para o tipo que especificarmos.
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        // 1. Encontrar o URL do arquivo no "pacote" do aplicativo.
        // O bundle é como uma pasta que contém todos os recursos do seu app.
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Não foi possível encontrar o arquivo \(filename) no bundle principal.")
        }
        
        // 2. Carregar os dados do arquivo.
        // Usamos um bloco do-catch para lidar com possíveis erros de leitura do arquivo.
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Não foi possível carregar o arquivo \(filename) do bundle:\n\(error)")
        }
        
        // 3. Decodificar os dados do JSON para o nosso modelo Swift.
        // Usamos um JSONDecoder para converter o texto do JSON em objetos 'Cha'.
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Não foi possível decodificar o arquivo \(filename) como \(T.self):\n\(error)")
        }
    }
}
