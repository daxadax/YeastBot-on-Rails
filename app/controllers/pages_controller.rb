class PagesController < ApplicationController
  
  def home
    
  end
  
  def search
    @search = params[:beer_search].titleize
    drive_login = GoogleDrive.login("yeastbot.on.rails@gmail.com", "ifeelyeasty")
    @yeast_db = drive_login.spreadsheet_by_key("0AmRc5_x3ehAfdFhBQ3pmczhqdHUtbmFONUYyZzVEY0E").worksheets[0]
    @matches = row_matcher(find_rows(@search))
  end
  
  private
  
  def find_rows(search)
    rows = []
    for row in 1..@yeast_db.num_rows
      @row = @yeast_db[row, 12].split(', ')
      if @row.include?(search)
        rows << row
      end
    end
    rows
  end
  
  def row_matcher(rows)
    this_row = []
    for row in rows
      for col in 1..@yeast_db.num_cols
        this_row << @yeast_db[row, col]
      end  
    end
    this_row.each_slice(15)
  end  
  
end