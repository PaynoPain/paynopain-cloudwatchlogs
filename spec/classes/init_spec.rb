require 'spec_helper'
describe 'cloudwatchlogs' do
  context 'with default values for all parameters' do
    it { should contain_class('cloudwatchlogs') }
  end
end
