different(red, green).
different(red, blue).
different(green, red).
different(green, blue).
different(blue, red).
different(blue, green).

colouring(Ibaraki, Tochigi, Gunma, Saitama, Chiba, Tokyo, Kanagawa) :-
  different(Ibaraki, Tochigi),
  different(Ibaraki, Saitama),
  different(Ibaraki, Chiba),
  different(Tochigi, Ibaraki),
  different(Tochigi, Gunma),
  different(Tochigi, Saitama),
  different(Gunma, Tochigi),
  different(Gunma, Saitama),
  different(Saitama, Ibaraki),
  different(Saitama, Gunma),
  different(Saitama, Chiba),
  different(Saitama, Tokyo),
  different(Chiba, Ibaraki),
  different(Chiba, Saitama),
  different(Chiba, Tokyo),
  different(Toyko, Saitama),
  different(Toyko, Chiba),
  different(Toyko, Kanagawa),
  different(Kanagawa, Tokyo).