# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  author           :string(255)      not null
#  editorial        :string(255)      not null
#  original_title   :string(255)
#  translation      :string(255)
#  edition          :integer
#  edition_date     :date
#  edition_place    :string(255)
#  publication_year :integer
#  isbn             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Book < ActiveRecord::Base
  belongs_to :editorial
  #validates :title, :author, :editorial, :presence => true
  #validates :title, :author, :editorial_id, :presence => true
  validates :edition, :publication_year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :picture,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    medium: '300x300>'
  }
end
