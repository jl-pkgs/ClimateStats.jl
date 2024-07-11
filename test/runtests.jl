using Test
using ClimateStats
import ClimateStats: cal_mTRS_base3!
using NaNStatistics
using Dates
using Ipaper: set_seed, obj_size

include("test-stat_anomaly.jl")
include("test-stat_threshold.jl")
include("test-stat_warmingLevel.jl")
