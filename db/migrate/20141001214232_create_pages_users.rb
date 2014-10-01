class CreatePagesUsers < ActiveRecord::Migration
  def change
    create_table :pages_users do |t|
      t.references :user, index: true
      t.references :page, index: true
    end
  end
end
