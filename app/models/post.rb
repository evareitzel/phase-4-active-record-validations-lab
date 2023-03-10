class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }


  validate :title_must_include_clickbait
  
  def title_must_include_clickbait
    if title.present?
      unless title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess")
        errors.add(:title, "hey no fair!")
      end
    end
  end

end
