class OrdersController < ApplicationController
   
   
    #CREATE 
    def new
        @item=Order.new
    end
    def create 
    @item=Order.new
    @item.fname=params["fname"]
    @item.lname=params["lname"]
    @item.email=params["email"]
    @item.phone=params["phone"]
    @item.ptime=params["ptime"]
    @item.pdate=params["pdate"]
    
    if @item.save
        redirect_to "/orders", :notice => "Order created successful."
    else
        render "new"
    end 
end 
    
   #READ
    def show 
        @order=Order.find_by(:id => params[:id])
        @order_item=OrderItem.new
        if @order.present?
            render "show"
        else
            redirect_to orders_url, :notice => "The record doesn't exist"
        end
    end
    
    def index
        @item=Order.all
        render "index"
   end
    
    
    

    
    
    
    #UPDATE
    def edit
        @item=Order.find(params[:id]) #How do I use find_by> | @item=Order.find_by(:id=>params[:id])
    render "edit"
    end
    
    def update
        @item=Order.find(params[:id])
        @item.fname =params["fname"]
        @item.lname =params["lname"]
        @item.email =params["email"]
        @item.photo =params["photo"]
        @item.ptime = params["ptime"]
        @item.dtime = params["dtime"]
        if @item.save
            redirect_to_orders_url(@item.id)
        else
            render "new"
        end
    end

    
    
    
    #DELETE
    
    def destroy 
        @item=Order.find(params[:id])
        @item.destroy
    redirect_to "/orders", :notice => "Order item deleted"
end
    
    
    
    
    
    
    
    
    
    
end