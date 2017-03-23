class PagesController < ApplicationController
  def home
    if current_user
      redirect_to vehicles_path
    end
  end
end
