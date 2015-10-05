with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is
   Matriz1 : array (1..4,1..4) of Integer;
   Matriz2 : array (1..4,1..4) of Integer;
   Matriz3 : array (1..4,1..4) of Integer;

   task type Multiplica is
      entry iniciar (inicio,fin:Integer);
   end Multiplica;

   task MulTotal is
      entry posicion (a,x,val:Integer);
   end MulTotal;

   task LlenaMatriz;

   task body LlenaMatriz is
    begin
     for i in 1..4 loop
      for j in 1..4 loop
         Matriz1 (i,j):= 2;
         Matriz2 (i,j):= 2;
         end loop;
      end loop;
   end LlenaMatriz;

   task body Multiplica is
      suma:Integer:=0;
   begin
      accept iniciar (inicio: Integer; fin: Integer) do
        for i in 1..4 loop
     for j in 1..4 loop
         for k in 1..4  loop
           matriz3(i,j) := matriz3(i,j) +  matriz1(i,k) * matriz2(k,j);
          end loop;
            end loop;
            end loop;
      end iniciar;
   end Multiplica;

   SubMatrices : array (0..4) of Multiplica;

   task body MulTotal is
      resultado : Integer:=0;
   begin
      for i in 0..4 loop
       accept posicion (a,x, val:Integer) do
         Matriz3(a,x):=val;
       end posicion;
      end loop;

      Put_Line("La multiplicación es");
       Put_Line("Matriz  3");
   for i in 1..500 loop
      for j in 1..500 loop
        Put(matriz3(i,j));
      end loop;
      Put_Line("");
   end loop;
   end MulTotal;

begin
   -- Put_Line("La multiplicación es");

   null;
end Main;
