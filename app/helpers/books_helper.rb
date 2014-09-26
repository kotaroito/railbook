module BooksHelper
    def list_tag(collection, prop)
        content_tag(:ul) do
            collection.each do |element|
                concat content_tag(:li, element.attributes[prop])
            end
        end
    end
end
