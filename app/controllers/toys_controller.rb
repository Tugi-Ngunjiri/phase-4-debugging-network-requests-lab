class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toys.create(toy_params)
  if toy.save
    render json: toy, status: :created
  else
    render json: { errors: toy.errors.full_messages }, status: :unprocessable_entity



  end

  def update
    toy = Toy.find_by(id: params[:id])
  if toy
    toy.update(likes: toy.likes +1)
    render json: toy, status: :ok
  else
    render json: { error: "Toy not found" }, status: :not_found
    end
  end
  # Existing code...
end

  def destroy
    toy = Toy.find_by(id: params[:id])
  if toy
    toy.destroy
    head :no_content
  # Performing any additional action
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes  ,:description)
  end

end
