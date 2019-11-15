class Aluno < ApplicationRecord
  belongs_to :turma, optional: true
  validates :nome, presence: { message: "é um campo obrigatório" }, length: {minimum: 5, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :email, presence: { message: "é um campo obrigatório" }, length: { minimum: 8, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :idade, presence: { message: "é um campo obrigatório" }, numericality: { only_integer: true, message: "deve conter apenas números" }
  validates :telefone, presence: { message: "é um campo obrigatório" }, numericality: { only_integer: true, message: "deve conter apenas números" }, length: { minimum: 9, maximum: 14, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)", too_long: "muito longo (o tamanho máximo é %{count} caracteres)" }
  validates :bairro, presence: { message: "é um campo obrigatório" }, length: { minimum: 5, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :nome_responsavel, presence: { message: "é um campo obrigatório" }, length: { minimum: 5, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :contato_responsavel, presence: { message: "é um campo obrigatório" }, numericality: { only_integer: true, message: "deve conter apenas números" }, length: { minimum: 8, maximum: 14, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)", too_long: "muito longo (o tamanho máximo é %{count} caracteres)" }
  validates :escola, presence: { message: "é um campo obrigatório" }, length: { minimum: 3, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
end
