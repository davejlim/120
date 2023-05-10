=begin
In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, 
it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

Is there anything wrong with fixing it this way?
=end

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

=begin
No, there shouldn't be anything wrong with changing the attr_reader to an attr_accessor,
as long as we are okay with creating a setter method for the instacne variable product_name.

Otherwise we can just add a separate attr_writer or an attr_accessor just for our quantity
instance variable.

But ideally if we create the setter method via the attr_ methods, we will want to invoke it
by prepending it with invoking it on the object with self.
=end