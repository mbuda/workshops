class ProductsController < ApplicationController
  before_action :is_owner?, only: [:update, :edit]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      if current_user.nil?
        redirect_to new_user_session_path
        return
      else
        category.products << product
        redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
      end
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      if current_user.nil?
        redirect_to new_user_session_path
      else
        redirect_to category_product_url(category, product)
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private
    def is_owner?
      if self.product.user != current_user && !current_user.nil?
        redirect_to category_product_url(category, product)
        flash[:error] =  'You are not allowed to edit this product.'
      end
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id)
    end
end
