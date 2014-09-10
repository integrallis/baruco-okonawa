module Formotion
  class Form < Formotion::Base
    def tableView(tableView, willDisplayCell: cell, forRowAtIndexPath: indexPath)
      cell.styleClass = 'table-cell'
      cell.updateStyles
    end
  end
end
