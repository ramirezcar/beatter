class LineItemsController < ApplicationController

  def create
    chosen_licence = Licence.find(params[:licence_id])
    current_cart = @current_cart
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.licences.include?(chosen_licence)
      # Find the line_item with the chosen_product
      @line_item = current_cart.line_items.find_by(:licence_id => chosen_licence)
      # Iterate the line_item's quantity by one 
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.licence = chosen_licence
    end

    respond_to do |format|
      # Save and redirect to cart show path
      if @line_item.save
        format.html { redirect_to cart_path(current_cart), notice: "#{t 'activerecord.successful.messages.created.line_item'}" }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private
  def line_item_params
    params.require(:line_item).permit(:licence_id, :cart_id)
  end
end
