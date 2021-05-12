class ItemSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :image_url

    def image_url
        rails_blob_path(object.image, disposition: "attachment", only_path: true)
    end
end
