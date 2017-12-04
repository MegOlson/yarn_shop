class Account < ActiveRecord::Base
  belongs_to :user

  # def bookmarked
  #   bookmark_order = self.orders.where(bookmarked: true).take
  #   if bookmark_order
  #     return bookmark_order
  #   else
  #     return self.order.create(status: "Saved for later!", bookmarked: true)
  #   end
  # end
end
