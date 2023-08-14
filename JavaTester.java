int[] array = { 5, 17, -4, 20, 12 };
int greatest = array[0];

for (int i = 0; i < array.length; i++) {
  if array[i] > greatest {
    greatest = array[i];
  }
}

System.out.printLn(greatest);