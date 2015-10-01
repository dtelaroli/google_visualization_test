class ChartController < ApplicationController
  def index
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string'  , 'Name')
    data_table.new_column('number'  , 'Salary')
    data_table.new_column('boolean' , 'Full Time Employee')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, 'Mike'  )
    data_table.set_cell(0, 1, {:v => 10000, :f => '$10,000'})
    data_table.set_cell(0, 2, true  )
    data_table.set_cell(1, 0, 'Jim'   )
    data_table.set_cell(1, 1, {:v => 8000 , :f => '$8,000' })
    data_table.set_cell(1, 2, false )
    data_table.set_cell(2, 0, 'Alice' )
    data_table.set_cell(2, 1, {:v => 12500, :f => '$12,500'})
    data_table.set_cell(2, 2, true  )
    data_table.set_cell(3, 0, 'Bob'   )
    data_table.set_cell(3, 1, {:v => 7000 , :f => '$7,000' })
    data_table.set_cell(3, 2, true  )

    opts   = { :width => 600, :showRowNumber => true }
    @table = GoogleVisualr::Interactive::Table.new(data_table, opts)


    data_table = GoogleVisualr::DataTable.new
    # Add Column Headers
    data_table.new_column('string', 'Year' )
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')

    # Add Rows and Values
    data_table.add_rows([
        ['2004', 1000, 400],
        ['2005', 1170, 460],
        ['2006', 660, 1120],
        ['2007', 1030, 540]
    ])
    option = { width: 400, height: 240, title: 'Company Performance' }
    @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)
  end
end
