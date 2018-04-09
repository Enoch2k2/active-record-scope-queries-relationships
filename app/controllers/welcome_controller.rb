class WelcomeController < ApplicationController
  def home
  end

  def search
    render :home
  end
end
