using Base.Test, SDT, HDF5

testType = "short"

if testType == "short"
    PC = [(1/3)+0.01: 0.01: 0.99]
elseif testType == "long"
    PC = [(1/3)+0.001: 0.001: 0.999]
end
nPC = length(PC)

dpOddity = zeros(nPC)

for i=1:nPC
    dpOddity[i] = dprimeOddity(PC[i])
end

fid = h5open("table_oddity.h5", "r")
psi_dp = read(fid["dp"])

@test_approx_eq_eps(dpOddity, psi_dp, 1e-4)
