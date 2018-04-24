class HtmlTag < ApplicationRecord
  def self.create_from(parsed_elements)
    create build_from(parsed_elements)
  end

  def self.build_from(elements)
    elements.map do |e|
      { name: e.name, content: e.to_s }
    end
  end
end
