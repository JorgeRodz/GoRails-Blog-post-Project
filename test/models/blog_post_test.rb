require "test_helper"

class BlogPostTest < ActiveSupport::TestCase

  # -------------------- draft scope tests --------------------
  test "draft? returns true for draft blog post" do
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for published blog post" do
    refute blog_posts(:published).draft?
  end

  test "draft? returns false for scheduled blog post" do
    # binding.irb
    refute blog_posts(:scheduled).draft?
  end

  # --------------------  published scope tests --------------------
  test "published? returns true for published blog post" do
    assert blog_posts(:published).published?
  end

  test "published? returns false for draft blog post" do
    refute blog_posts(:draft).published?
  end

  test "published? returns false for scheduled blog post" do
    # binding.irb
    refute blog_posts(:scheduled).published?
  end

  # --------------------  scheduled scope tests --------------------
  test "scheduled? returns true for scheduled blog post" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for draft blog post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns false for published blog post" do
    # binding.irb
    refute blog_posts(:published).scheduled?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end
end
