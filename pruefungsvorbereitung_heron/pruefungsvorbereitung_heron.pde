double x = 1.0;
for(int i = 0; i < 5; i++)
{
  println("x_" + i + " = " + x);
  x = 0.5 * (x + 2 / x);
}
println("wurzel(2.0) = " + x);
  
