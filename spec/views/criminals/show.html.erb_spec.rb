require 'spec_helper'

describe "criminals/show.html.erb" do
  before(:each) do
    @criminal = assign(:criminal, stub_model(Criminal,
      :name => "Name",
      :gender => "Gender",
      :race => "Race",
      :eye_color => "Eye Color",
      :hair_color => "Hair Color",
      :photo => "Photo",
      :additional_info => "MyText",
      :age => "Age"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gender/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Race/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Eye Color/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Hair Color/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Photo/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Age/)
  end
end
