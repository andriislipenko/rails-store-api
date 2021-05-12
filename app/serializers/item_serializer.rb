class ItemSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :image_url

    def image_url
        url_for(object.image)
    end
end
