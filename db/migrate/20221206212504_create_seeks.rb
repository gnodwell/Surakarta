class CreateSeeks < ActiveRecord::Migration[6.1]
  def change
    create_table :seeks do |t|

      t.timestamps
    end
  end
end
