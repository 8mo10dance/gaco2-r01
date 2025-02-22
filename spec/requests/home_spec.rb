require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    subject { get "/" }

    it { is_expected.to eq 200 }
  end
end
