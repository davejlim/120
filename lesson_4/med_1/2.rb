=begin
Alan created the following code to keep track of items for a shopping cart application he's writing:

Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

Can you spot the mistake and how to address it?
=end

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin
Alyssa is right that this will fail when update_quantity is called because it is
currently trying to find a local variable named quantity as there is no
setter method created nor would we be invoking a setter method correctly
created by an attr_accessor or attr_ writer (which can be accessed with self.quantity).

We can fix this by prepending quantity with an @ which would have us access
the instance variable and reassigning it to the updated_count.
=end
