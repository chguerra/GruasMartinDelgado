require	'pry'
class NewJob < ApplicationMailer
	default :from => 'web@gruasmartindelgado.com'

	def send_new_job_info(client, delivery, vehicle, origin, destiny)
		@client = client
		@delivery = delivery
		@vehicle = vehicle
		@origin = origin
		@destiny = destiny

 		if @delivery.document_file_name != nil
		attachments.inline[@delivery.document.original_filename] = File.read(@delivery.document.path)
		end
		
		mail(:to => 'asistenciamartindelgado@gmail.com',
			:subject => 'Nueva solicitud de transporte: ' + vehicle.bastidor_matricula )
	end
end
