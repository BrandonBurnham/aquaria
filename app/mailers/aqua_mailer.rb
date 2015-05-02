class AquaMailer < ActionMailer::Base
  default from: "alerts@bcb2net.com"
  
  def delete_email(aquarium)
    @aquarium = aquarium
    @url = aquaria_path
    mail(to: 'alerts@bcb2net.com', subject: 'Aquarium Deleted')
  end
  
  def edit_email(aquarium)
    @aquarium = aquarium
    @url = aquaria_path
    mail(to: 'alerts@bcb2net.com', subject: 'Aquarium Modified')
  end
end
