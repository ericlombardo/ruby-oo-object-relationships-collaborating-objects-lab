require 'pry'
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end
  def files   # found article on stackoverflow about this lab, realized you must change back to original directory
    working_directory = Dir.pwd # records path to return to after switching
    Dir.chdir path  # changes directory to path of files you want
    file_list = Dir.glob("*.mp3")   # collects mp3 files in directory
    Dir.chdir working_directory # sets directory back to the original path
    file_list # return list of mp3 files
  end
  
  def import  # sends filename to Song class to create song instances
    files.each do |filename|  # get array of files from #files method and loops through
      Song.new_by_filename(filename)  # for each one it creates a song instance and links artist
    end
  end
end

