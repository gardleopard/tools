module Views
  class Upload < Layout
    def uploaded 
      if @filename
        "uploaded: " + @filename
      else
        ""
      end
    end
  end
end

