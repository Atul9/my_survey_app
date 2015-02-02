class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :survey_type
      t.date :conducted_on
      t.integer :count_people

      t.timestamps null: false
    end
  end
end
