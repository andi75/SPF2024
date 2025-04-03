void setup()
{
  println("6! = " + fakultaet(6));
  println("10! = " + fakultaet(10));
}

int fakultaet(int n)
{
  int result = 1;
  for(int i = 2; i <= n; i++)
  {
    result *= i;
  }
  return result;
}
