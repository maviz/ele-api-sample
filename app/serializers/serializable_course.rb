class SerializableCourse < JSONAPI::Serializable::Resource
  type 'course'

  attributes :name

  attribute :date do
    @object.created_at
  end

  belongs_to :author

  has_many :talents do
    data do
      @object.talents
    end

    # link :related do
    #   @url_helpers.user_posts_url(@object.id)
    # end

    # meta do
    #   { count: @object.published_comments.count }
    # end
  end

  # link :self do
  #   @url_helpers.course_url(@object.id)
  # end

  # meta do
  #   { featured: true }
  # end
end

