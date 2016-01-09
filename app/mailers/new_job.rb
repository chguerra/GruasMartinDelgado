require	'pry'
class NewJob < ApplicationMailer
	default :from => 'web@gruasmartindelgado.com'

	def send_new_job_info(client, delivery, vehicle, origin, destiny)
		@client = client
		@delivery = delivery
		@vehicle = vehicle
		@origin = origin
		@destiny = destiny

		mail(:to => 'chguerra@gmail.com',
			:subject => 'Nueva solicitud de transporte')
	end
end
