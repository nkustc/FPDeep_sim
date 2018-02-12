clear;

test = SHIFT_REG();

for index=1:10
    test.data_in = PIXEL(index);
    test.consume(1);
    test.produce(1);
end
for index = 1:8
    test.reg_array{index}
    %test.data_disp{index}
end


