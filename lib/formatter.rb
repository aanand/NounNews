require 'titlecase'

class Formatter
  def format(str)
    str = str.strip
    str = str.sub(/^video:\s+/i, '')
    str = str.titlecase
    str
  end
end