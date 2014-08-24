class Uploadzipfile < ActiveRecord::Base
	attr_accessible :name, :zipfile
	mount_uploader :zipfile, ZipfileUploader

  def listfiles
  	files = []
    Zip::File.open(zipfile.current_path) do |zip_file|
      # Handle entries one by one
      zip_file.each do |entry|
        files << entry.name if entry.ftype == :file
      end
    end
    files
  end

  def readfile(file)
    Zip::File.open(zipfile.current_path) do |zip_file|
      # Handle entries one by one
      zip_file.each do |entry|
        if entry.name == file
          return entry.get_input_stream.read
        end
      end
    end
  end
end
