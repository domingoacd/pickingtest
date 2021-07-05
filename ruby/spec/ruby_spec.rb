# frozen_string_literal: true

RSpec.describe Ruby do
  it 'has a version number' do
    expect(Ruby::VERSION).not_to be nil
  end

  it 'gets recommended token articles from scenario 1' do
    expect(get_recommendations_from_JSON('recommendations1.json')).to eq([345_048])
  end

  it 'gets recommended token articles from scenario 2' do
    expect(get_recommendations_from_JSON('recommendations2.json')).to eq([790_952, 103_678, 788_138, 802_358])
  end

  it 'gets recommended token articles from scenario 3' do
    expect(get_recommendations_from_JSON('recommendations3.json')).to eq([103_678, 790_952, 802_358, 788_138])
  end

  it 'gets recommended token articles from scenario 4' do
    expect(get_recommendations_from_JSON('recommendations4.json')).to eq([790_952, 103_678, 802_358, 562_873])
  end
end
