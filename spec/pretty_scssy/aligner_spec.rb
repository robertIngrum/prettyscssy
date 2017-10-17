require 'spec_helper'

RSpec.describe PrettyScssy::Aligner do
  context '.run' do
    it 'should create an instance of itself and then run it' do
      expect(described_class).to receive(:run).and_call_original
      expect_any_instance_of(described_class).to receive(:run)

      described_class.run
    end
  end
end
