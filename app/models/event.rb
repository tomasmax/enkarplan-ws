class Event < ActiveRecord::Base
  belongs_to :poi
  
  validates_presence_of :starts_at
  validates_presence_of :ends_at
  
  def as_json options=nil
    options ||= {}
    options[:methods] = ((options[:methods] || []) + [:poi_slug, :poi_title])
    super options
  end
  
  def poi_slug
    poi.slug
  end
  
  def poi_title
    poi.title
  end
  
end
