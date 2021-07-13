class ContactMailer < ApplicationMailer
    def contact_mail(patient)
        @patient = patient
        mail to: "own e-mail address", subject: "confirmation e-mail of inquiry"
    end
end
