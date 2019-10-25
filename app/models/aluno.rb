class Aluno < ApplicationRecord
  belongs_to :turma, optional: true
  validates :nome, presence: true, length: {minimum: 5, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :email, presence: true, length: { minimum: 8, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :idade, presence: true, numericality: { only_integer: true, message: "deve conter apenas números" }
  validates :telefone, presence: true, numericality: { only_integer: true, message: "deve conter apenas números" }, length: { minimum: 9, maximum: 14, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)", too_long: "muito longo (o tamanho máximo é %{count} caracteres)" }
  validates :bairro, presence: true, length: { minimum: 5, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :nome_responsavel, presence: true, length: { minimum: 5, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :contato_responsavel, presence: true, numericality: { only_integer: true, message: "deve conter apenas números" }, length: { minimum: 8, maximum: 14, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)", too_long: "muito longo (o tamanho máximo é %{count} caracteres)" }
  validates :escola, presence: true, length: { minimum: 5, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
end
