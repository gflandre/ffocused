class PortfoliosController < ApplicationController
  layout "back"
  
  skip_before_filter :find_current_portfolio, :only => [:show, :create, :new]
  
  def new
    @portfolio = Portfolio.new
    render :layout => "home"
  end

  def create
    # FIXME: security
    @portfolio = Portfolio.create!(params[:portfolio])
    redirect_to portfolio_path(@portfolio)
  end

  def order_categories
    params[:item_ids].each_with_index do |item_id, i|
      @current_portfolio.categories.find(item_id).update_attribute(:position, i)
    end
    render :nothing => true
  end

  def edit
  end

  def show
    session[:current_portfolio_id] = params[:id]
    @current_portfolio = Portfolio.find(session[:current_portfolio_id])
  end

  def update
    # FIXME: security
    flash[:notice] = {:title =>t("success"), :text => t("portfolios.update.notice_text")}
    @current_portfolio.update_attributes(params[:portfolio])
    redirect_to portfolio_path(@current_portfolio)
  end

end
