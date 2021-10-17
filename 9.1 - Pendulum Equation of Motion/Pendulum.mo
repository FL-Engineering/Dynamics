model Pendulum
  inner Modelica.Mechanics.MultiBody.World world(animateWorld = false, axisColor_x = {255, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-84, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = true, start = 0.785398)) annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0.5, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 2) annotation(
    Placement(visible = true, transformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame FrameP(color_x = {0, 255, 0})  annotation(
    Placement(visible = true, transformation(origin = {74, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = -90, n = {0, 0, 1})  annotation(
    Placement(visible = true, transformation(origin = {-54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-8, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{12, 0}, {26, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, pointMass.frame_a) annotation(
    Line(points = {{46, 0}, {64, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, FrameP.frame_a) annotation(
    Line(points = {{46, 0}, {52, 0}, {52, 46}, {64, 46}}, color = {95, 95, 95}));
  connect(fixed.frame_b, fixedRotation.frame_a) annotation(
    Line(points = {{-68, 0}, {-64, 0}}));
  connect(fixedRotation.frame_b, revolute.frame_a) annotation(
    Line(points = {{-44, 0}, {-8, 0}}));
  connect(fixedRotation.frame_b, fixedFrame.frame_a) annotation(
    Line(points = {{-44, 0}, {-32, 0}, {-32, 46}, {-18, 46}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
end Pendulum;
