class AddWebsitesToHtmlTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :html_tags, :website, index: true
    add_foreign_key :html_tags, :website
  end
end
