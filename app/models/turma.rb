class Turma < ApplicationRecord
  has_many :alunos
  has_many :professors
end
