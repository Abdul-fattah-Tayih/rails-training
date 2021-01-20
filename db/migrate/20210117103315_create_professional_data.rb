class CreateProfessionalData < ActiveRecord::Migration[6.0]
  def change
    create_table :professional_data do |t|
      t.hstore 'title'
      t.datetime 'started_at'
      t.datetime 'ended_at'
      t.belongs_to :employee
      t.timestamps
    end
  end
end
