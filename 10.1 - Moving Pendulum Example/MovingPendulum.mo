model MovingPendulum
  inner Modelica.Mechanics.MultiBody.World world(animateWorld = false)  annotation(
    Placement(visible = true, transformation(origin = {-88, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {-40, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {52, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = false, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {20, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {78, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.5, freqHz = 0.25)  annotation(
    Placement(visible = true, transformation(origin = {-82, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position annotation(
    Placement(visible = true, transformation(origin = {-48, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame GroundFrame(color_x = {255, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-16, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = -90, n = {0, 0, 1})  annotation(
    Placement(visible = true, transformation(origin = {-54, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame LinkFrame(color_x = {0, 255, 0})  annotation(
    Placement(visible = true, transformation(origin = {86, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.AccSensor accSensor annotation(
    Placement(visible = true, transformation(origin = {-14, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle = -90, n = {0, 0, 1}) annotation(
    Placement(visible = true, transformation(origin = {-10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{30, 8}, {42, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, pointMass.frame_a) annotation(
    Line(points = {{62, 8}, {78, 8}}, color = {95, 95, 95}));
  connect(sine.y, position.s_ref) annotation(
    Line(points = {{-71, 56}, {-60, 56}}, color = {0, 0, 127}));
  connect(position.flange, prismatic.axis) annotation(
    Line(points = {{-38, 56}, {-32, 56}, {-32, 14}}, color = {0, 127, 0}));
  connect(fixedRotation.frame_b, GroundFrame.frame_a) annotation(
    Line(points = {{-44, -40}, {-26, -40}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, LinkFrame.frame_a) annotation(
    Line(points = {{62, 8}, {68, 8}, {68, 26}, {76, 26}, {76, 44}}));
  connect(world.frame_b, prismatic.frame_a) annotation(
    Line(points = {{-78, 8}, {-50, 8}, {-50, 8}, {-50, 8}}, color = {95, 95, 95}));
  connect(world.frame_b, fixedRotation.frame_a) annotation(
    Line(points = {{-78, 8}, {-70, 8}, {-70, -40}, {-64, -40}, {-64, -40}}, color = {95, 95, 95}));
  connect(prismatic.axis, accSensor.flange) annotation(
    Line(points = {{-32, 14}, {-28, 14}, {-28, 42}, {-24, 42}, {-24, 42}}, color = {0, 127, 0}));
  connect(prismatic.frame_b, fixedRotation1.frame_a) annotation(
    Line(points = {{-30, 8}, {-20, 8}, {-20, 8}, {-20, 8}}, color = {95, 95, 95}));
  connect(fixedRotation1.frame_b, revolute.frame_a) annotation(
    Line(points = {{0, 8}, {10, 8}, {10, 8}, {10, 8}}));
  annotation(
    experiment(StartTime = 0, StopTime = 10));
    
  annotation(uses(Modelica(version = "3.2.3"))); 
end MovingPendulum;
