: Dynamics that track inside calcium concentration
: Hay et al. 2011, modified from Destexhe et al. 1994

NEURON  {
    SUFFIX CaDyn
    USEION ca READ ica WRITE cai
    RANGE tau, gamma, cainf, depth
}

UNITS   {
    (mV) = (millivolt)
    (mA) = (milliamp)
    FARADAY = (faraday) (coulombs)
    (molar) = (1/liter)
    (mM) = (millimolar)
    (um)    = (micron)
}

PARAMETER   {
    gamma = 0.05 : percent of free calcium (not buffered)
    tau = 80 (ms) : rate of removal of calcium
    depth = 0.1 (um) : depth of shell
    cainf = 1e-4 (mM)
}

ASSIGNED    {ica (mA/cm2)}

STATE   {
    cai (mM)
    }

BREAKPOINT  { SOLVE states METHOD cnexp }

DERIVATIVE states   {
    cai' = -(10000)*(ica*gamma/(2*FARADAY*depth)) + (cainf - cai) / tau
}