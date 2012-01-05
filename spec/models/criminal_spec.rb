require 'spec_helper'

describe Criminal do
 it { should have_valid(:photo).when('uploads/photos/asd.jpg')}
 it { should have_valid(:name).when('""') }
 it { should have_valid(:age).when('""') }
 it { should have_valid(:gender).when('""') }
 end




