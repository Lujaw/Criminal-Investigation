require 'spec_helper'

describe Result do
   it { should_not have_valid(:name).when('""') }
   it { should_not have_valid(:age).when('""') }
   it { should_not have_valid(:gender).when('""') }
   it { should_not have_valid(:race).when('""') }
   it { should_not have_valid(:hair-color).when('""') }
   it { should_not have_valid(:eye_color).when('""') }
   it { should have_valid(:additional_info).when('""', 'mole on left cheek') }
   it { should have_valid(:gender).when('Male','Female') }
   end
end
