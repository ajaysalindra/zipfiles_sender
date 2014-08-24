class Zipmailer < ActionMailer::Base
  default from: "from@example.com"
  def payslip(uploadzipfile, filename, employee)
  
  	basename = filename.split('/').last
  	attachments[basename] = uploadzipfile.readfile(filename)
  	mail(:to => employee.email, subject: "Your payslip #{employee.name}")
  end

end
