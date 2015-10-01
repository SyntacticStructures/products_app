class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	render '/products/index/'
  end

  def new
  	@product = Product.new()
  end

  def create
  	@product = Product.create( name: params[:name], description: params[:description], pricing: params[:pricing] )
  	if @product.valid?
  		redirect_to '/products/'
  	else
  		render '/products/new/'
  	end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	# There HAS to be a better way to do this other than 1X1
  	@product.name = params[:name]
  	@product.description = params[:description]
  	@product.pricing = params[:pricing]
  	if @product.valid?
  		@product.save
  		redirect_to '/products/'
  	else
  		render '/products/new/'
  	end
  end

  def destroy
  	Product.delete(params[:id])
  	redirect_to '/products/'
  end

end