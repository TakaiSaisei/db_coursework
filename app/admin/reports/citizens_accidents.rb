ActiveAdmin.register_page 'Citizen accidents' do

  menu label: "Citizen accidents", parent: "Reports"

  content title: "Citizen accidents report" do
    panel "Top 10" do
      query = "SELECT citizens.first_name || ' ' || citizens.middle_name || ' ' || citizens.second_name AS Citizen,
                SUM(amount) as \"Total amount\" FROM penalties
                LEFT JOIN citizens ON citizens.id = penalties.citizen_id
                GROUP BY citizens.id
                ORDER BY \"Total amount\" DESC"
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
