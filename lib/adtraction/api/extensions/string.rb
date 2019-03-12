class String
    
  def camelize(first_letter = :upper)
    string = self
    
    case first_letter
    when :upper
      string = string.sub(/^[a-z\d]*/) { $&.capitalize }
    when :lower
      string = string.sub(/^(?:(?=\b|[A-Z_])|\w)/) { $&.downcase }
    else
      raise ArgumentError, "Invalid option, use either :upper or :lower."
    end

    string.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
  end
  
end
