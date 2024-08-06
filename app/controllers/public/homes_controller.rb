class Public::HomesController < ApplicationController
  layout 'application', except: [:about]

  def about
    render :layout => nil
  end

  def top
  end
end
