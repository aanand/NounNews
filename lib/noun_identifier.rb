module NounIdentifier
  def self.default
    require 'noun_identifier/override'
    require 'noun_identifier/brian'
    NounIdentifier::Override.new(NounIdentifier::Brian.new)
  end
end