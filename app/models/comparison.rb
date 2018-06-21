class Comparison < ApplicationRecord

	include AttachmentUploader[:attachment]
	include AttachmentUploader[:attachment2]
	 #Mounts paperclip image
  #has_attached_file :cvpad
  #has_attached_file :notepad
end
