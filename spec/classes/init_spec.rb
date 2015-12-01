require 'spec_helper'
describe 'action' do

  context 'with defaults for all parameters' do
    it { should contain_class('action') }
  end
end
