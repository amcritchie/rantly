class MailConfirmerController < ApplicationController

  def confirm_and_destroy

    uuid = params[:confirmation_token]

    pending_user = MailConfirmer.where(uuid: uuid).first

    email = pending_user.email

    found_user = User.find_by_email(email)

    found_user.update_attributes(email_confirmed: true)

    pending_user.destroy()

    redirect_to root_path
  end

end