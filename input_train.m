% written by CW Tsai 2015 04 03
% 
% example
%[label,data] = input_train('train_out_map.txt')
% 1 is start position 128 is end position

function [label,data] = input_train(filename)
% output 48 types 
row_size = 48;
% batch size
col_size = 1124822;
endRow = col_size;
startRow = 1;
label = input_label(filename,startRow, endRow,row_size,col_size);
data = input_data(filename,1, col_size);
