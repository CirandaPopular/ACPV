class Turma < ApplicationRecord
  has_many :alunos
  has_and_belongs_to_many :professors
  validates :nome, presence: true
  validates :cidade_turma, presence: true
  #validates :horarioInicio, presence: true
  #validates :horarioFim, presence: true
end
