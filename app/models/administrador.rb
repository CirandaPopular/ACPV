class Administrador < ApplicationRecord
  has_secure_password
  validates :nome, presence: true, length: {minimum: 6, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }
  validates :email, presence: true, length: { minimum: 10, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)" }, uniqueness: {case_sensitive: false}
  validates :telefone, presence: true, length: { minimum: 8, maximum: 13, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)", too_long: "muito longo (o tamanho máximo é %{count} caracteres)" }
  validates :password, presence: true, length: {minimum: 6, too_short: "muito curto (o tamanho mínimo da senha é %{count} caracteres)"}
  validates :cidade_voluntario, presence: true
  before_save { self.email = email.downcase }
end