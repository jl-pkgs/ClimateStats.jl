module ClimateStats

using Ipaper
using Printf
using Dates
using NaNStatistics

using Reexport
@reexport using DocStringExtensions: TYPEDSIGNATURES, METHODLIST

include("base.jl")
include("threshold.jl")
include("climatology.jl")
include("anomaly.jl")
include("warming_level.jl")

# export cal_mTRS_base, cal_mTRS_season, cal_mTRS_full
export format_md
export cal_climatology_base, cal_climatology_full, cal_climatology_full, 
  _cal_anomaly, 
  cal_anomaly_quantile, cal_anomaly_clim, cal_threshold,
  cal_warming_level, cal_yearly_Tair


export filter_mds

end # module ClimateStats
