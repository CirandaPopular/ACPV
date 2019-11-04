class Turma < ApplicationRecord
  has_many :alunos
  has_and_belongs_to_many :professors
  validates :nome, presence: true
end
