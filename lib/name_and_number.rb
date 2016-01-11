require 'csv'
puts 'Event Manager: Name and Number'

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

# template_letter = File.read "form_letter.erb"
# erb_template = ERB.new template_letter
def proper_phone_numbers(phone)
  if phone.to_s.delete(" ()-.").length > 10 && phone[0] == 1
    phone = phone[1..10]
  elsif phone.to_s.delete(" ()-.").length > 10 && phone[0] != 1
    phone = ""
  elsif phone.to_s.delete(" ()-.").length < 10
    phone = ""
  else
    phone = phone.to_s.delete(" ()-.")
  end
end

contents.each do |row|
  name = row[:first_name]
  phone = proper_phone_numbers(row[:homephone])

  puts "#{name} #{phone}"
end
