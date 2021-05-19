ActiveAdmin.register_page 'Manufacters accidents' do

  menu label: "Manufacters accidents", parent: "Reports"

  content title: "Manufacters accidents report" do
    panel "Top 10" do
      query = "SELECT cars.manufacter as Manufacter, COUNT(*) as \"Count\"
                 FROM cars INNER JOIN accidents_cars
                 ON cars.id = accidents_cars.car_id
                 GROUP BY cars.manufacter ORDER BY \"Count\" DESC"
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
