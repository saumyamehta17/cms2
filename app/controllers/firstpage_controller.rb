class FirstpageController < ApplicationController
  before_filter :authenticate_user!

end
