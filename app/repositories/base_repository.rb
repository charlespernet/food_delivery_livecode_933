require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    load_csv if File.exists?(@csv_file)
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find do |element|
      element.id == id
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @elements << build_element(row)
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << build_headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end
end