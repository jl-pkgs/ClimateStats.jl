using PrecompileTools


@setup_workload begin
  dates = Date(1960, 1, 1):Day(1):Date(1961, 12, 31) |> collect
  
  @compile_workload begin
    ## precompile for cal_anomaly_quantile
    function test_anomaly2(; T=Float32, dims=(2,))
      ntime = length(dates)

      A = rand(T, dims..., ntime)
      kw = (; parallel=true, p1=1960, p2=1960, na_rm=false, probs=[0.5, 0.9])

      @time anom_season = cal_anomaly_quantile(A, dates; kw..., method="season")
      @time anom_base = cal_anomaly_quantile(A, dates; kw..., method="base")
      # @time anom_full = cal_anomaly_quantile(A, dates; kw..., method="full")

      @assert size(anom_base) == (dims..., ntime, length(kw.probs))
      @assert size(anom_base) == size(anom_season)
      # @assert size(anom_base) == size(anom_full)
    end

    set_seed(1)
    l_dims = [(), (2,), (2, 2), (2, 2, 2)]
    for T in (Float32, Float64)
      for dims = l_dims
        test_anomaly2(; T, dims)
      end
    end

  end
end
