class ApplicationController < ActionController::Base

   private

  def set_side
    if admin_signed_in?
      @side = 'admin'
    elsif customer_signed_in?
      @side = 'public'
    else
      @side= 'guest'
    end
  end
  
  def set_aside
    if admin_signed_in?
      @aside = 'admin'
    elsif customer_signed_in?
      @aside = 'public'
    else
      @aside= 'guest'
    end
  end

end
