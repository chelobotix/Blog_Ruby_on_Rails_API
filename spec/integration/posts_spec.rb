# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Blog API' do

  path '/api/v1/users/:id/posts' do

    get 'Retrieves all Posts' do
      tags 'Post'
      produces 'application/json', 'application/xml'
      parameter user_id: :id, :in => :path, :type => :integer

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :string, },
            created_at: { type: :string, },
            updated_at: { type: :string, },
            title: { type: :string, },
            text: { type: :text },
            comments_counter: { type: :integer },
            likes_counter: { type: :integer },
            author_id: { type: :integer },
          },
          required: [ 'id' ]

        let(:id) { Post.create(title: 'My Post', text: 'Post content bla bla bla') }
        run_test!
      end

      response '404', 'post not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end

