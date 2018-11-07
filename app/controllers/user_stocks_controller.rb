class UserStocksController < ApplicationController

    def create
        stock = Stock.find_by_ticker(params[:stock_ticker])
        if stock.blank?
            stock = Stock.new_form_lookup(params[:stock_ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:success] = "Stock #{@user_stock.stock.name} is successfully added to the portfolio"
        redirect_to my_portfolio_path
    end
end
