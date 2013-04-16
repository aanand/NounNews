RSpec::Matchers.define :be_nouns do |expected|
  match_for_should do |actual|
    actual.all? { |word| subject.is_noun?(word) }
  end

  failure_message_for_should do |actual|
    actual.reject { |word| subject.is_noun?(word) }.inspect + " are not nouns"
  end

  match_for_should_not do |actual|
    actual.none? { |word| subject.is_noun?(word) }
  end

  failure_message_for_should_not do |actual|
    actual.select { |word| subject.is_noun?(word) }.inspect + " are nouns"
  end
end