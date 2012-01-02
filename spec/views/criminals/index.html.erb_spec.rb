require 'spec_helper'

describe "criminals/index.html.erb" do
  before(:each) do
    assign(:criminals, [
      stub_model(Criminal,
        :name => "Name",
        :gender => "Gender",
        :race => "Race",
        :eye_color => "Eye Color",
        :hair_color => "Hair Color",
        :photo => "Photo",
        :additional_info => "MyText",
        :age => "Age"
      ),
      stub_model(Criminal,
        :name => "Name",
        :gender => "Gender",
        :race => "Race",
        :eye_color => "Eye Color",
        :hair_color => "Hair Color",
        :photo => "Photo",
        :additional_info => "MyText",
        :age => "Age"
      )
    ])
  end

  it "renders a list of criminals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Race".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Eye Color".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hair Color".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Age".to_s, :count => 2
  end
end
