ThinkingSphinx::Index.define :post, :with => :active_record do
  # fields
  indexes title, :sortable => true
  indexes description
  indexes user.email
  indexes comments.body
  has created_at, updated_at
end