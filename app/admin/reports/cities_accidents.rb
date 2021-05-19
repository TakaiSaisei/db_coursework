ActiveAdmin.register_page 'Cities accidents' do

  menu label: "Cities accidents", parent: "Reports"

  content title: "Cities accidents report" do
    panel "Top 10" do
      query = "SELECT cities.name AS City, COUNT(accidents.id) as \"Count\" FROM accidents
                LEFT JOIN addresses ON addresses.id = accidents.address_id
                LEFT JOIN cities ON cities.id = addresses.city_id
                GROUP BY cities.id ORDER BY \"Count\" DESC"
      @result = ActiveRecord::Base.connection.exec_query(query)
      bar_chart @result.rows.first(10)
    end
    columns do
      unless @result.nil?
        table class: 'index_table index' do
          thead do
            tr do
              @result.columns.each do |name|
                th name, class: :col
              end
            end
          end
          tbody do
            @result.rows.each_with_index do |col, i|
              tr class: ((i % 2).zero? ? 'odd' : 'even') do
                col.each do |val|
                  td val, class: :col
                end
              end
            end
          end
        end
      end
    end
  end
end
