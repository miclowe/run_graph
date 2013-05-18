class CreateRunData < ActiveRecord::Migration
  def change
    create_table :run_data do |t|

      t.timestamps
    end
  end
end
