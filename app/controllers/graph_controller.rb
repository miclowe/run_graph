class GraphController < ApplicationController

  def index
  end

  def d3chart
  end

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

  def morris
    rundata = RunData.new
    data = rundata.get_data

    render :json => data
  end

end
