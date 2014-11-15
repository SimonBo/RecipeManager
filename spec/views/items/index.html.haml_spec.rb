require 'rails_helper'

RSpec.describe "items/index", :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :recipe => nil,
        :ingredient => nil,
        :user => nil,
        :amount => "9.99",
        :measure => "Measure"
      ),
      Item.create!(
        :recipe => nil,
        :ingredient => nil,
        :user => nil,
        :amount => "9.99",
        :measure => "Measure"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Measure".to_s, :count => 2
  end
end
