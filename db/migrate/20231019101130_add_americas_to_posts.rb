class AddAmericasToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :america, :string
    add_column :posts, :uk, :string
    add_column :posts, :canada, :string
    add_column :posts, :aus, :string
  end
end
