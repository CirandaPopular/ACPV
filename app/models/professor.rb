class Professor < ApplicationRecord
  has_and_belongs_to_many :turmas
  has_secure_password
  validates :nome, presence: { message: "é um campo obrigatório" }, length: {minimum: 6, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :email, presence: { message: "é um campo obrigatório" }, length: { minimum: 10, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :idade, presence: { message: "é um campo obrigatório" }, numericality: { only_integer: true, message: "não é um número" }
  validates :telefone, presence: { message: "é um campo obrigatório" }, length: { minimum: 8, maximum: 13, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)", too_long: "muito longo (o tamanho máximo é %{count} caracteres)" }
  validates :endereco, presence: { message: "é um campo obrigatório" }, length: { minimum: 6, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :cidade, presence: { message: "é um campo obrigatório" }, length: { minimum: 3, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :grau_instrucao, presence: { message: "é um campo obrigatório" }
  validates :cidade_voluntario, presence: { message: "é um campo obrigatório" }
  validates :disponibilidade_voluntario, presence: { message: "é um campo obrigatório" }
  validates :area_atuacao, presence: { message: "é um campo obrigatório" }
#  validates :password, presence: { message: "é um campo obrigatório" }, length: {minimum: 6, too_short: "muito curto (o tamanho mínimo da senha é %{count} caracteres)"}
  before_save { self.email = email.downcase }
end
