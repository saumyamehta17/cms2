class Page < ActiveRecord::Base
  belongs_to :site
  attr_accessible :content, :title
end
