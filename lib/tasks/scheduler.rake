desc "This task is called by the Heroku scheduler add-on"

task :reconfirmation => :environment do
    puts "Checking for reconfirmation..."
    date = Time.now
    requests = Request.confirmed
    requests.each do |request|   
        # byebug
        if (!request.reconfirmation_date && ((date - request.email_confirmation_date) / 86400).to_i == 0 )
            puts "1 - #{request.id} - #{(date - request.email_confirmation_date).to_i}j - #{request.email_confirmation_date}"
            request.set_confirmation_token
            if request.save!
                request.send_reconfirmation_email
            end 
        elsif request.reconfirmation_date?
            if ((date - request.reconfirmation_date) /86400).to_i == 0
                puts "2 - #{request.id} - #{(date - request.reconfirmation_date).to_i}j - #{request.reconfirmation_date}"
                if request.save!
                    request.send_reconfirmation_email
                end
            end 
        end 
    end
  puts "done."
end

task :expiration => :environment do
    puts "Checking for expiration..."
    date = Time.now
    requests = Request.confirmed
    requests.each do |request|   
        if (!request.reconfirmation_date && ((date - request.email_confirmation_date) /86400).to_i == 97 )
            puts "1 - #{request.id}"
            request.send_expiration_email 
            request.update!(status: 3)
        elsif request.reconfirmation_date?
            if ((date - request.reconfirmation_date) /86400).to_i == 97
                puts "2 - #{request.id}"
                request.send_expiration_email 
                request.update!(status: 3)
            end
        end 
    end
    puts "done."
end