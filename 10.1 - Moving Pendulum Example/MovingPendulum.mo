model MovingPendulum
  inner Modelica.Mechanics.MultiBody.World world(animateWorld = false)  annotation(
    Placement(visible = true, transformation(origin = {-88, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {-40, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {52, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute annotation(
    Placement(visible = true, transformation(origin = {20, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 100)  annotation(
    Placement(visible = true, transformation(origin = {78, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.5, freqHz = 0.25)  annotation(
    Placement(visible = true, transformation(origin = {-142, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  Modelica.Blocks.Sources.Clock clock annotation(
    Placement(visible = true, transformation(origin = {-234, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-154, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Clock clock1 annotation(
    Placement(visible = true, transformation(origin = {-234, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-194, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {-82, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {-208, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold annotation(
    Placement(visible = true, transformation(origin = {-144, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{30, 8}, {42, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, pointMass.frame_a) annotation(
    Line(points = {{62, 8}, {78, 8}}, color = {95, 95, 95}));
  connect(position.flange, prismatic.axis) annotation(
    Line(points = {{-38, 56}, {-32, 56}, {-32, 14}}, color = {0, 127, 0}));
  connect(fixedRotation.frame_b, GroundFrame.frame_a) annotation(
    Line(points = {{-44, -40}, {-26, -40}}, color = {95, 95, 95}));
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
  connect(fixedTranslation.frame_b, LinkFrame.frame_a) annotation(
    Line(points = {{62, 8}, {66, 8}, {66, 44}, {76, 44}}));
  connect(product.y, gain.u) annotation(
    Line(points = {{-183, 88}, {-166, 88}}, color = {0, 0, 127}));
  connect(gain.y, switch1.u1) annotation(
    Line(points = {{-143, 88}, {-106, 88}, {-106, 64}, {-94, 64}}, color = {0, 0, 127}));
  connect(sine.y, switch1.u3) annotation(
    Line(points = {{-131, 12}, {-118.5, 12}, {-118.5, 48}, {-94, 48}}, color = {0, 0, 127}));
  connect(clock1.y, product.u2) annotation(
    Line(points = {{-223, 66}, {-212, 66}, {-212, 82}, {-206, 82}}, color = {0, 0, 127}));
  connect(clock.y, product.u1) annotation(
    Line(points = {{-223, 102}, {-212, 102}, {-212, 94}, {-206, 94}}, color = {0, 0, 127}));
  connect(switch1.y, position.s_ref) annotation(
    Line(points = {{-70, 56}, {-60, 56}, {-60, 56}, {-60, 56}}, color = {0, 0, 127}));
  connect(const.y, greaterThreshold.u) annotation(
    Line(points = {{-197, 30}, {-166.5, 30}, {-166.5, 56}, {-156, 56}}, color = {0, 0, 127}));
  connect(greaterThreshold.y, switch1.u2) annotation(
    Line(points = {{-133, 56}, {-94, 56}}, color = {255, 0, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 10),
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}}), graphics = {Text(origin = {-217, 17}, extent = {{-23, 9}, {43, -29}}, textString = "0 = Sine Input\n1 = Constant Acceleration")}),
    Icon(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    version = ""); 
end MovingPendulum;
