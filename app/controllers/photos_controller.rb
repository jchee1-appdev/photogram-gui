class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end


  def show

    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id})
    @the_photo = matching_photos.first


    render({ :template => "photo_templates/show.html.erb"})
  end

  def delete
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.first

    the_photo.destroy
    redirect_to("/photos")

    #render({ :template => "photo_templates/delete.html.erb"})

  end

  def create

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")

    new_photo = Photo.new
    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

    new_photo.save

    redirect_to("/photos/" + new_photo.id.to_s)

    #render({ :template => "photo_templates/create.html.erb"})
  end

  def update
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.first

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")


    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save
    redirect_to("/photos/" + the_photo.id.to_s)

  end

  def insert_comment
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")


    new_comment = Comment.new
    new_comment.author_id = input_author_id
    new_comment.body = input_body
    new_comment.photo_id = input_photo_id

    new_comment.save
    
    redirect_to("/photos/" + input_photo_id.to_s)

  end
end
