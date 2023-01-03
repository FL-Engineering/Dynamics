model DoublePendulumDerivedEquations
  Real L1 = 1;
  Real L2 = 1;
  Real m1 = 5;
  Real m2 = 5;
  Real g = Modelica.Constants.g_n;
  Real theta;
  Real thetaDot;
  Real phi;
  Real phiDot;
  Real A1;
  Real B1;
  Real A2;
  Real B2;
initial equation
  theta = Modelica.Constants.pi/2;
  phi = 0;
equation
  thetaDot = der(theta);
  phiDot = der(phi);
  A1 = m1 * L1 ^ 2 * der(thetaDot) + m2 * L2 ^ 2 * (der(thetaDot) + der(phiDot)) + m2 * L1 ^ 2 * der(thetaDot) + 2 * m2 * L1 * L2 * (der(thetaDot) * cos(phi) - thetaDot * phiDot * sin(phi)) + m2 * L1 * L2 * (der(phiDot) * cos(phi) - phiDot ^ 2 * sin(phi));
  B1 = (-m1 * g * L1 * sin(theta)) - m2 * L1 * g * sin(theta) - m2 * L2 * g * sin(theta + phi);
  A1 - B1 = 0;
  A2 = m2 * L2 ^ 2 * (der(thetaDot) + der(phiDot)) + m2 * L1 * L2 * (der(thetaDot) * cos(phi) - thetaDot * phiDot * sin(phi));
  B2 = (-m2 * L1 * L2 * thetaDot ^ 2 * sin(phi)) - m2 * L1 * L2 * thetaDot * phiDot * sin(phi) - m2 * L2 * g * sin(theta + phi);
  A2 - B2 = 0;
  annotation(
    uses(Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end DoublePendulumDerivedEquations;
