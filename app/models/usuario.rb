class Usuario < ApplicationRecord
  has_secure_password
  validates :nome, presence: true, length: {minimum: 6, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)"}
  validates :password, presence: true, length: {minimum: 6, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)"}
  validates :email, presence: true, length: {minimum: 10, too_short: "muito curto (o tamanho mínimo é %{count} caracteres)"}, uniqueness: {case_sensitive: false}
  before_save {self.email = email.downcase}
end
