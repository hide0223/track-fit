class HomesController < ApplicationController
  layout 'application', except: [:about]

  def about
    @customer = Customer.new
    render :layout => nil
  end

end
