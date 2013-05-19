class GraphController < ApplicationController

  def statusboard
    rundata = RunData.new
    data = rundata.get_data

    render :json => {
      "graph" => {
        "title" => "Nike Running Data",
        "total" => true,
        "datasequences" => [
          { "title" => "Runs per month",
            "datapoints" => data
          },
        ]
      }
    }
  end

end
