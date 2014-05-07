require 'securerandom'
class SchematicsController < ApplicationController

  def create
    schem = Schematic.new(params.require(:schematic).permit(:name, :schematic))
    if schem.name.blank?
      flash[:error] = 'Name cannot be blank'
      redirect_to '/upload'
      return
    end

    begin
      schem.save!
    rescue Mongoid::Errors::Validations
      flash[:error] = 'Please upload a .schematic file'
      redirect_to '/upload'
      return
    end
    begin
      schem_file = MCSchematic.new schem.get_file
      schem.materials = schem_file.nbt[1]['Materials'].value
      schem.width = schem_file.width
      schem.height = schem_file.height
      schem.length = schem_file.length
    rescue MCSchematic::SchematicException::UnreadableFile, MCSchematic::SchematicException::IncorrectFormat, Zlib::GzipFile::Error
      flash[:error] = "Sorry, we couldn't read that schematic"
      redirect_to '/upload'
      return
    end
    schem.created_at = Time.now
    schem[:hash] = SecureRandom.urlsafe_base64(4)
    if user_signed_in?
      schem.user = current_user
    end
    schem.save!
    flash[:notice] = 'Schematic uploaded!'
    redirect_to '/' + schem[:hash]
  end

end