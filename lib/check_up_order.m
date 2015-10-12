function Flag = check_up_order(Ma, Arg, i)

    Len  = length(Arg);
    Bit  = 3;
    Flag = false;

    for k = 1:Len-1;

        if sum(Ma(i-Bit+1:i,k) > Ma(i-Bit+1:i,k+1)) == Bit

            Flag = true;

        else
            
            Flag = false;
            
            return

        end

    end

end