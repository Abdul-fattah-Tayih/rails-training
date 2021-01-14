class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :employees do |t|
      t.hstore 'name'
      t.hstore 'title'
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
