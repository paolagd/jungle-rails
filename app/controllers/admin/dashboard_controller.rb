class Admin::DashboardController < Admin::BaseController
  before_action :authenticate
  
  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
