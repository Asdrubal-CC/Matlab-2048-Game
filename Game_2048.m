% NO COMMERCIALIZATION OF THE SOURCE CODE IS ALLOWED UNDER ANY CIRCUMSTANCES

fprintf("\n")
fprintf("Welcome to Math_Game, a replicate of 2048 created by me, Asdrubal Cheng\n")
fprintf("in request from my brother Aaron Cheng. Enjoy the Game.\n\n")
fprintf("Instructions:\n\n")
fprintf("The game consists in a matrix where you add numbers through a series of\n")
fprintf("directions that are equal until you cannot do this anymore.\n\n")
fprintf("Rules:\n\n")
fprintf("- Press 'a' to move all the numbers left\n")
fprintf("- Press 'w' to move all the numbers up\n")
fprintf("- Press 's' to move all the numbers down\n")
fprintf("- Press 'd' to move all the numbers right\n")
fprintf("- Press 'e' to exit\n\n")
fprintf("Good Luck!\n\n")

matrix = zeros(4);

rng('shuffle');
r_1 = randi([1,4]);
c_1 = randi([1,4]);

r_2 = randi([1,4]);
c_2 = randi([1,4]);

while matrix(c_1,r_1) == 0 && matrix(c_2,r_2) == 0
    while c_1 == c_2 && r_1 == r_2
        r_1 = randi([1,4]);
        c_1 = randi([1,4]);
    end
matrix(c_1,r_1) = 2;
matrix(c_2,r_2) = 2;
fprintf('%3d %3d %3d %3d \n', matrix);
end

for rows1 = 2:3
    for columns1 = 2:3
        while matrix(rows1, columns1) == matrix(rows1+1,columns1) || ...
              matrix(rows1, columns1) == matrix(rows1-1,columns1) || ...
              matrix(rows1, columns1) == matrix(rows1, columns1+1) || ...
              matrix(rows1, columns1) == matrix(rows1, columns1-1) || ...
              matrix(1,1) == matrix(1,2) || matrix(1,1) == matrix(2,1) || ...
              matrix(4,1) == matrix(3,1) || matrix(4,1) == matrix(4,2) || ...
              matrix(1,4) == matrix(1,3) || matrix(1,4) == matrix(2,4) || ...
              matrix(4,4) == matrix(3,4) || matrix(4,4) == matrix(4,3) || ...
              matrix(1,2) == matrix(1,3) || matrix(4,2) == matrix(4,3) || ...
              matrix(2,1) == matrix(3,1) || matrix(2,4) == matrix(3,4) || ...
              ~isempty(find(matrix == 0, 1))

direction = input('Enter a direction:', 's');

switch direction
    case 'w'
       
        for columns = 1:4
            for rows = 1:3
                while matrix(columns,rows) == matrix(columns,rows+1) && ...
                        matrix(columns,rows) ~= 0
                    news = matrix(columns,rows) + matrix(columns,rows+1);
                    matrix(columns,rows) = news;
                    matrix(columns,rows+1) = 0;
                end
            end
        end
        for columns = 1:4
            for rows = 1:2
                while matrix(columns,rows) == matrix(columns,rows+2) && ...
                   matrix(columns,rows) ~= 0 && matrix(columns,rows+1) == 0
                    news = matrix(columns,rows) + matrix(columns,rows+2);
                    matrix(columns,rows) = news;
                    matrix(columns,rows+2) = 0;
                end
            end
        end
        for columns = 1:4
            for rows = 1:1
                while matrix(columns,rows) == matrix(columns,rows+3) && ...
                      matrix(columns,rows) ~= 0 && matrix(columns,rows+1) ...
                      == 0 && matrix(columns,rows+2) == 0
                    news = matrix(columns,rows) + matrix(columns,rows+3);
                    matrix(columns,rows) = news;
                    matrix(columns,rows+3) = 0;
                end
            end
        end
       
    for counter = 1:3
        for columns0 = 1:4
            for rows0 = 1:3
                    while matrix(columns0, rows0) == 0 && ...
                          matrix(columns0, rows0+1) ~= 0
                        matrix(columns0, rows0) = matrix(columns0, rows0+1);
                        matrix(columns0, rows0+1) = 0;
                    end
            end
        end
    end
   
      if isempty(find(matrix == 0, 1)) == 0
        c = find(matrix == 0);
        b = randi([1, length(c)]);
        v = [2 4];
        x = randi([1,2]);
        matrix(c(b)) = v(x);
      end
       
        fprintf('%3i %3i %3i %3i \n',matrix);
       
    case 's'
             
        for columns = 1:4
            for rows = 2:4
                while matrix(columns,rows) == matrix(columns,rows-1) && ...
                      matrix(columns,rows) ~= 0
                    news = matrix(columns,rows) + matrix(columns,rows-1);
                    matrix(columns,rows) = news;
                    matrix(columns,rows-1) = 0;
                end
            end
        end
        for columns = 1:4
            for rows = 3:4
                while matrix(columns,rows) == matrix(columns,rows-2) && ...
                      matrix(columns,rows) ~= 0 && matrix(columns,rows-1) ...
                      == 0
                    news = matrix(columns,rows) + matrix(columns,rows-2);
                    matrix(columns,rows) = news;
                    matrix(columns,rows-2) = 0;
                end
            end
        end
        for columns = 1:4
            for rows = 4:4
                while matrix(columns,rows) == matrix(columns,rows-3) && ...
                      matrix(columns,rows) ~= 0 && matrix(columns,rows-1) ...
                      == 0 && matrix(columns,rows-2) == 0
                    news = matrix(columns,rows) + matrix(columns,rows-3);
                    matrix(columns,rows) = news;
                    matrix(columns,rows-3) = 0;
                end
            end
        end
       
    for counter = 1:3
        for columns0 = 1:4
            for rows0 = 2:4
                    while matrix(columns0, rows0) == 0 && ...
                          matrix(columns0, rows0-1) ~= 0
                        matrix(columns0, rows0) = matrix(columns0, rows0-1);
                        matrix(columns0, rows0-1) = 0;
                    end
            end
        end
    end
   
    if isempty(find(matrix == 0, 1)) == 0
        c = find(matrix == 0);
        b = randi([1, length(c)]);
        v = [2 4];
        x = randi([1,2]);
        matrix(c(b)) = v(x);
    end
       
        fprintf('%3i %3i %3i %3i \n',matrix);
       
    case 'd'
       
        newmatrix = rot90(matrix);
       
          for columns = 1:4
            for rows = 2:4
                while newmatrix(columns,rows) == newmatrix(columns,rows-1) ...
                      && newmatrix(columns,rows) ~= 0
                    news = newmatrix(columns,rows) + newmatrix(columns,rows-1);
                    newmatrix(columns,rows) = news;
                    newmatrix(columns,rows-1) = 0;
                end
            end
          end
        
        for columns = 1:4
            for rows = 3:4
                while newmatrix(columns,rows) == newmatrix(columns,rows-2) ...
                      && newmatrix(columns,rows) ~= 0 && newmatrix(columns,rows-1) == 0
                    news = newmatrix(columns,rows) + newmatrix(columns,rows-2);
                    newmatrix(columns,rows) = news;
                    newmatrix(columns,rows-2) = 0;
                end
            end
        end
        for columns = 1:4
            for rows = 4:4
                while newmatrix(columns,rows) == newmatrix(columns,rows-3) ...
                      && newmatrix(columns,rows) ~= 0 && ...
                      newmatrix(columns,rows-1) == 0 && ...
                      newmatrix(columns,rows-2) == 0
                    news = newmatrix(columns,rows) + newmatrix(columns,rows-3);
                    newmatrix(columns,rows) = news;
                    newmatrix(columns,rows-3) = 0;
                end
            end
        end
       
    for counter = 1:3
        for columns0 = 1:4
            for rows0 = 2:4
                    while newmatrix(columns0, rows0) == 0 && ...
                          newmatrix(columns0, rows0-1) ~= 0
                        newmatrix(columns0, rows0) = newmatrix(columns0, rows0-1);
                        newmatrix(columns0, rows0-1) = 0;
                    end
            end
        end
    end
       
        matrix = rot90(newmatrix, 3);
       
if isempty(find(matrix == 0, 1)) == 0
        c = find(matrix == 0);
        b = randi([1, length(c)]);
        v = [2 4];
        x = randi([1,2]);
        matrix(c(b)) = v(x);
end
       
   
        fprintf('%3i %3i %3i %3i \n',matrix);
       
    case 'a'
       
        newmatrix = rot90(matrix, 3);
       
          for columns = 1:4
            for rows = 2:4
                while newmatrix(columns,rows) == newmatrix(columns,rows-1) ...
                      && newmatrix(columns,rows) ~= 0
                    news = newmatrix(columns,rows) + newmatrix(columns,rows-1);
                    newmatrix(columns,rows) = news;
                    newmatrix(columns,rows-1) = 0;
                end
            end
          end
        
        for columns = 1:4
            for rows = 3:4
                while newmatrix(columns,rows) == newmatrix(columns,rows-2) ...
                      && newmatrix(columns,rows) ~= 0 && ...
                      newmatrix(columns,rows-1) == 0
                    news = newmatrix(columns,rows) + newmatrix(columns,rows-2);
                    newmatrix(columns,rows) = news;
                    newmatrix(columns,rows-2) = 0;
                end
            end
        end
        for columns = 1:4
            for rows = 4:4

                while newmatrix(columns,rows) == newmatrix(columns,rows-3) ...
                      && newmatrix(columns,rows) ~= 0 && ...
                      newmatrix(columns,rows-1) == 0 && ...
                      newmatrix(columns,rows-2) == 0
                    news = newmatrix(columns,rows) + newmatrix(columns,rows-3);
                    newmatrix(columns,rows) = news;
                    newmatrix(columns,rows-3) = 0;
                end
                
            end
        end
       
    for counter = 1:3
        for columns0 = 1:4
            for rows0 = 2:4
                    while newmatrix(columns0, rows0) == 0 && ...
                          newmatrix(columns0, rows0-1) ~= 0
                        newmatrix(columns0, rows0) = newmatrix(columns0, rows0-1);
                        newmatrix(columns0, rows0-1) = 0;
                    end
            end
        end
    end
       
        matrix = rot90(newmatrix, 1);
   
if isempty(find(matrix == 0, 1)) == 0
        c = find(matrix == 0);
        b = randi([1, length(c)]);
        v = [2 4];
        x = randi([1,2]);
        matrix(c(b)) = v(x);
end
       
        fprintf('%3i %3i %3i %3i \n',matrix);
       
    case 'e'
       
        matrix = [1:4 ; 5:8 ; 9:12 ; 13:16];
        fprintf('%3i %3i %3i %3i \n',matrix);
 
    otherwise
       
        fprintf('%3i %3i %3i %3i \n',matrix);
        fprintf('This is not a direction, try again \n');
     
end
        end
    end
end

disp('Game Over')




