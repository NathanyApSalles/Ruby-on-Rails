class CreatePontuations < ActiveRecord::Migration[5.1]
  def change
    create_table :pontuations do |t|
      t.date :data
      t.string :nome
      t.integer :idUsuario
      t.integer :pontos

      t.timestamps
    end
  end
end
