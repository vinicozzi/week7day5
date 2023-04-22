# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :bigint           not null
#  author_id  :bigint           not null
#
class Post < ApplicationRecord
    validates :title, :sub_id, :author_id, presence: true 
    
    belongs_to :author, 
    foreign_key: :author_id, 
    class_name: :User 

    belongs_to :sub,
    foreign_key: :sub_id, 
    class_name: :Sub 


end
