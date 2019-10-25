class Professor < ApplicationRecord
  has_and_belongs_to_many :turmas
  validates :nome, presence: true, length: {minimum: 6, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :email, presence: true, length: { minimum: 10, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :idade, presence: true, numericality: { only_integer: true, message: "não é um número" }
  validates :telefone, presence: true, length: { minimum: 8, maximum: 13, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)", too_long: "muito longo (o tamanho máximo é %{count} caracteres)" }
  validates :endereco, presence: true, length: { minimum: 6, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :cidade, presence: true
  validates :grau_instrucao, presence: true
  validates :cidade_voluntario, presence: true
  validates :disponibilidade_voluntario, presence: true
  validates :area_atuacao, presence: true
end
