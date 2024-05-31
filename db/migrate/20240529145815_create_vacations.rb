class CreateVacations < ActiveRecord::Migration[7.1]
  def change
    create_table :vacations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :vacation_days
      t.date :starting_date
      t.date :ending_date
      t.string :bonus

      t.timestamps
    end
  end
end
