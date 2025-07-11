//
//  Cha.swift
//  Folio
//
//  Created by Lucas Dal Pra Brascher on 10/07/25.
//
import Foundation

// MARK: - Cha Struct
// Este é o nosso "molde" para cada chá no aplicativo.
// Conforma-se com Codable para que possamos carregar dados de um arquivo JSON facilmente.
// Conforma-se com Identifiable para que cada chá tenha um ID único, o que é útil para listas e navegação.
struct Cha: Codable, Identifiable {
    var id: Int
    var nome: String
    var nomeCientifico: String
    var imagemNome: String // Usaremos este nome para encontrar a imagem nos assets
    var descricao: String
    var beneficios: [String]
    var preparo: String
    var contraindicacoes: String
}
