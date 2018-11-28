function res=fft_hw(x_len,x_list)
if(x_len==2)
    tmp1=x_list(1)+x_list(2);
    tmp2=x_list(1)-x_list(2);
    tmp_list=[tmp1,tmp2];
    disp('x_len:')
    disp(x_len)
    disp('res:')
    disp(tmp_list)
    
    res=tmp_list;
    
else
    next_len=x_len/2;
    next_list1=[];
    for i=1:2:x_len
        next_list1=[next_list1,x_list(i)];
    end
    next_list2=[];
    for i=2:2:x_len
        next_list2=[next_list2,x_list(i)];
    end
    next_res1=fft_hw(next_len,next_list1);
    next_res2=fft_hw(next_len,next_list2);
    res_list=[];
    W_N=exp(-sqrt(-1)*2*pi/x_len);
    for i=1:next_len
        res_list(i)=next_res1(i)+W_N^(i-1)*next_res2(i);
        res_list(i+next_len)=next_res1(i)-W_N^(i-1)*next_res2(i);
    end
    disp('x_len:')
    disp(x_len)
    disp('res:')
    disp(res_list)
    res=res_list;
end
    
    
    
    
    