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

    def destroy
        stock = Stock.find(params[:id])
        @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
        @user_stock.destroy
        flash[:notice] = "Stock is successfuly remove from the posrtolio"
        redirect_to my_portfolio_path
    end
end
