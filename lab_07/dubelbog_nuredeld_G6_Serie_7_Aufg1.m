function [b] = dubelbog_nuredeld_G6_Serie_7_Aufg1()

clear;
s = 3;

fu = cell(4);
fu{1} = @(u) (u+1).*(u+2).*(u+3);
fu{2} = @(u) u.*(u+2).*(u+3);
fu{3} = @(u) u.*(u+1).*(u+3);
fu{4} = @(u) u.*(u+1).*(u+2);


for j=0:s
    [T] = dubelbog_nuredeld_G6_Serie_3_Aufg3(fu{j+1}, 0, 1, s);
    b(j+1) = ((-1).^j./(factorial(j)*factorial(s-j))) * T;
end

% check
% b_correct = [55/24 59/24 37/24 9/24];
% zeros = abs(b) - b_correct;
% for i=1:length(zeros)
%     if zeros(i) ~= 0
%         disp("Value of b is not correct");
%     end
% end
  


