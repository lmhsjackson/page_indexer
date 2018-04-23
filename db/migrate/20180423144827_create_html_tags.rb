class CreateHtmlTags < ActiveRecord::Migration[5.1]
  def change
    create_table :html_tags do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
