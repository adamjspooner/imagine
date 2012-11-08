class Item < ActiveRecord::Base
  attr_accessible :description, :title, :image
  mount_uploader :image, ImageUploader
  before_create :default_title

  private

  def default_title
    self.title ||= File.basename(image.filename, '.*').titleize if image
  end
end
