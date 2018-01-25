encodings = Encoding
              .list
              .each.with_object({}) do |enc, full_list|
                  full_list[enc.name] = [enc.name]
              end

Encoding.aliases.each do |alias_name, base_name|
  fail "#{base_name} #{alias_name}" unless encodings[base_name]
  encodings[base_name] << alias_name
end

puts(encodings
        .values
        .sort_by {|base_name, *| base_name.downcase}
        .map do |base_name, *rest|
          if rest.empty?
            base_name
          else
            "#{base_name} (#{rest.join('. ')})"
          end
      end)

#Encoding Class
#Objects of class Encoding each represent a different character encoding.
#Encodings commonly used in Ruby include ASCII, ASCII-8BIT, UTF-8, and Shift JIS
#
#Source Files
#If using non ASCII source files, declare encoding in the first line of file with following(include the #):

# coding:utf-8

#Since Ruby 2.0 the default encoding is UTF-8
#
#Transcoding
#You can convert a string from one encoding to another using the String#encode method
#
ole_in_utf = "olé"
ole_in_utf.encoding
ole_in_utf.bytes.to_a # => [111, 108, 195, 169]

ole_in_8859 = ole_in_utf.encode("iso-8859-1")
ole_in_8859.encoding
ole_in_8859.bytes.to_a # => [111, 108, 233]

#if the target encoding does not contain characters, Ruby will throw an exception.

pi = "pi = π"
pi.encode("iso-8859-1") #Throws Encoding::UndefinedConversionError

#This can be overridden by supplying a placeholder character to use when no direct translation is possible:

pi_in_8859 = pi.encode("iso-8859-1", :undef => :replace, :replace => "??")

#Transcoding Binary Data
#In scenarios where a string contains binary data and that data must be interpreted in a particular encoding, you cannot use #encode as this would change the byte contents of the string
#Instead use #force_encoding:
#
# encoding: ascii-8bit

str = "\xc3\xa9"
str.encoding
str.force_encoding("utf-8")
str.bytes.to_a
str.encoding

