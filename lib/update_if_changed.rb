module ActiveRecord
  module Persistence
    def update_if_changed(attributes)
      self.assign_attributes(attributes)
      self.update(attributes) if self.changed?
    end
  end
end
