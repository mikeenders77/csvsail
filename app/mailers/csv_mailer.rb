class CsvMailer < ApplicationMailer
    def csv_email(user, attach)
      @user = user
      @attach = attach
      @path = "public/download/#{@attach}"
      #name = @attach
      attachments[@attach] = File.read(@path)
      mail(to: anthonycmark@gmail.com , subject: 'Your CSV is ready again')
      
      
    end
  end