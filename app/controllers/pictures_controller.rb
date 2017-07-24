class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    @older_pictures = Picture.older_pictures
    @pictures_in_2017 = Picture.pictures_created_in_year(2017)
    @pictures_in_2016 = Picture.pictures_created_in_year(2016)
    @pictures_in_2015 = Picture.pictures_created_in_year(2015)

  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new #creating a new instance of the pictures that is empty, bcuz the form will use this to correctl create the views.
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]  # params[:picture] is a hash in the params hash. here, ur using the values saved in the params hash, and setting them to the values needed.
    @picture.artist = params[:picture][:artist] # the params hash will have all the form data, its not part of the database.
    @picture.url = params[:picture][:url] # you are creating an nstance, and adding user data to that instance.


    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id]) # in every method, the same instance variable will have a different value.
    @picture.destroy
    redirect_to "/pictures"
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id]) #remember that you have to get access to the variable everytime are dealing with a new request.

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

end
