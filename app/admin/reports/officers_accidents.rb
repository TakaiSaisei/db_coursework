ActiveAdmin.register_page 'Officers accidents' do

  menu label: "Officers accidents", parent: "Reports"

  content title: "Officers accidents report" do
    panel "Top 10" do
      query = "SELECT citizens.first_name || ' ' || citizens.middle_name || ' ' || citizens.second_name AS Officer,
                COUNT(accidents.id) AS \"Count\" FROM accidents
                LEFT JOIN officers ON officers.id = accidents.officer_id
                LEFT JOIN citizens ON citizens.id = officers.citizen_id
                GROUP BY officers.id ORDER BY \"Count\" DESC"
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
