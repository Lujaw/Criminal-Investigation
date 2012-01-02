require 'spec_helper'

describe "criminals/new.html.erb" do
  before(:each) do
    assign(:criminal, stub_model(Criminal,
      :name => "MyString",
      :gender => "MyString",
      :race => "MyString",
      :eye_color => "MyString",
      :hair_color => "MyString",
      :photo => "MyString",
      :additional_info => "MyText",
      :age => "MyString"
    ).as_new_record)
  end

  it "renders new criminal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => criminals_path, :method => "post" do
      assert_select "input#criminal_name", :name => "criminal[name]"
      assert_select "input#criminal_gender", :name => "criminal[gender]"
      assert_select "input#criminal_race", :name => "criminal[race]"
      assert_select "input#criminal_eye_color", :name => "criminal[eye_color]"
      assert_select "input#criminal_hair_color", :name => "criminal[hair_color]"
      assert_select "input#criminal_photo", :name => "criminal[photo]"
      assert_select "textarea#criminal_additional_info", :name => "criminal[additional_info]"
      assert_select "input#criminal_age", :name => "criminal[age]"
    end
  end
end
