class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }

  # BlogPost.draft
  scope :draft, -> { where(published_at: nil) }

  # BlogPost.published
  scope :published, -> { where('published_at <= ?', Time.current) }

  # BlogPost.scheduled
  scope :scheduled, -> { where('published_at > ?', Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end

=begin

Status string field:
- draft
- published
- scheduled

'published_at' datetime field
- nil
- 1.year.ago - time
- 1.year.from_now - time

=end
