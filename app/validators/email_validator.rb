require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    begin
      puts "KOALAS USER"
    end
    #record.errors[attribute] << (options[:message] || "is invalid") unless r
  end
end