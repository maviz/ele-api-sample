class SerializableUser < JSONAPI::Serializable::Resource
  type 'user'

  attributes :name

  attribute :date do
    @object.created_at
  end


  has_many :authored_courses do
    data do
      @object.authored_courses
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

  meta do
    { featured: true }
  end
end

