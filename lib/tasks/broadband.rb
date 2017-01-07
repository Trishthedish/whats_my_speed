class Broadband
  attr_reader :name, :accessFrom, :num_of_tests, :download, :upload

  def initialize(name, accessFrom, num_of_tests, download, upload)
    @name = name
    @accessFrom = accessFrom
    @num_of_tests = num_of_tests
    @download = download
    @upload = upload

    if name = nil || name = "" || accessFrom = nil || accessFrom = "" || num_of_tests = nil || num_of_tests = "" || download = nil || download = "" || upload = nil || upload = ""
    end

  end

end
