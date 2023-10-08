program game;
uses PABCSystem;
Type question =  record
q_text : String;
q_variants : array [1..4] of String;
q_answer: Integer;
end;

var questions : array [1..100] of question;
i : Integer;
f : text;
score : Integer;
       

procedure check(q :Integer; n :Integer);
 begin
   if questions[q].q_answer = n then
   begin
     writeln('Правилный ответ');
     score := score + 1;
     end  
     else
       writeln('Неправильный ответ');
     
     writeln('_________________________');
 end;



procedure  display_question(q :Integer);
  var n,i :Integer;
  begin
    writeln(questions[q].q_text);
    
    for i:=1 to 4 do 
      writeln('Вариант',i,': ',questions[q]. q_variants[i]);

    write('Ввод: ');
   
    readln(n);

    if (n >= 1) and (n < 5) then
      check(q,n)
    else 
        writeln('Введите число от 1 до 4');         
  end;
  
begin
  score:= 0;
  
  assign(f, 'questions.txt');
  reset(f);
    
   //fill array answers_array
  while not eof(f) do
  begin
    i := i+1;
    readln(f, questions[i].q_text);
    readln(f, questions[i].q_variants[1]);
    readln(f, questions[i].q_variants[2]);
    readln(f, questions[i].q_variants[3]);
    readln(f, questions[i].q_variants[4]);
    readln(f, questions[i].q_answer);
  end;
    
  close(f);
  
  
  writeln('Начинаем игру!');
  
  for i:= 1 to 11 do
   display_question(i);
  writeln('Ваш Счет: ', score);
end.
